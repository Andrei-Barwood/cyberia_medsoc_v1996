# frozen_string_literal: true

require_relative '../models/episode'

class BladesScannerService
  def self.execute_scan(payload)
    mode = (payload['mode'] || payload[:mode] || 'mri_logic').to_s
    case mode
    when 'locked_out_gates', 'mri_logic'
      mri_logic_scan('locked_out_gates', payload)
    when 'graffiti_hydraulics'
      mri_logic_scan('graffiti_hydraulics', payload)
    when 'genius_symbols'
      solve_genius_symbols(payload)
    when 'infrared'
      infrared_scan((payload['episode_id'] || payload[:episode_id] || 1).to_i)
    when 'biometric_dpi'
      biometric_dpi_scan(payload['protocol_payload'] || payload[:protocol_payload] || 'HL7_FHIR_PACKET')
    else
      {
        status: 'SCAN_COMPLETE',
        scanner: 'BLADES v19.96 (InfRared / MRI / Biometric)',
        mode: mode,
        timestamp: Time.now.utc.iso8601,
        findings: 'All PLC ladder registers and DICOM headers verified.'
      }
    end
  end

  def self.infrared_scan(episode_id)
    ep = Episode.find_by_id(episode_id) || Episode.all.first
    {
      scanner_mode: 'BLADES INFRARED THERMOGRAPHY',
      episode_code: ep['code'],
      game_node: ep['game_node_code'],
      ambient_signature_c: ep['act_number'] == 5 ? -196.0 : 36.8,
      thermal_anomaly_detected: true,
      target_asset: ep['iomt_asset'],
      status_color: '#00F200',
      telemetry_note: ep.dig('pillars', 'detection', 'telemetry_indicator')
    }
  end

  def self.mri_logic_scan(circuit_type, inputs = {})
    if circuit_type.to_s == 'graffiti_hydraulics'
      solve_graffiti_hydraulics(inputs)
    else
      solve_locked_out_gates(inputs)
    end
  end

  def self.biometric_dpi_scan(protocol_payload)
    text = protocol_payload.to_s
    suspicious = text.match?(/DEAD|CARTEL|DEVLIN|HALON|OVERFLOW|RANSOM/i)
    {
      scanner_mode: 'BLADES BIOMETRIC DEEP PACKET INSPECTION (DPI)',
      inspected_bytes: text.bytesize,
      threat_detected: suspicious,
      status_color: suspicious ? '#E7F800' : '#83FF65',
      verdict: suspicious ? 'QUARANTINE_TRIGGERED (YARA/SIGMA MATCH)' : 'CLEAN_CLINICAL_FRAME (HL7/DICOM VERIFIED)'
    }
  end

  def self.solve_locked_out_gates(payload)
    a = truthy?(payload['input_a'] || payload[:input_a])
    b = truthy?(payload['input_b'] || payload[:input_b])
    c = truthy?(payload['input_c'] || payload[:input_c])

    # EP22 LOCKED OUT boolean logic: (A AND NOT B) AND (B OR C) => requires A=true, B=false, C=true
    gate_not_b = !b
    gate_and_1 = a && gate_not_b
    gate_or_2  = b || c
    solenoid_unlocked = gate_and_1 && gate_or_2

    {
      episode: 'EP22 - LOCKED OUT',
      scanner: 'BLADES MRI CIRCUIT DEBUGGER',
      inputs: { input_a: a, input_b: b, input_c: c },
      intermediate_gates: { not_b: gate_not_b, and_upper: gate_and_1, or_lower: gate_or_2 },
      solenoid_unlocked: solenoid_unlocked,
      status_color: solenoid_unlocked ? '#00F200' : '#E7F800',
      message: if solenoid_unlocked
                 'SOLENOIDE DE ESCLUSA QUIRÚRGICA DESBLOQUEADO: Presión positiva verificada (IEC 61131-3 Formal Check PASS).'
               else
                 'CIRCUITO BLOQUEADO: Combinación booleana inválida. Pista MRI: Activa A (1), Desactiva B (0), Activa C (1).'
               end
    }
  end

  def self.solve_graffiti_hydraulics(payload)
    valves = payload['valves'] || payload[:valves] || []
    valves = valves.values if valves.is_a?(Hash)
    valves_open = valves.map { |v| truthy?(v) }
    main_pump = truthy?(payload['main_pump'] || payload[:main_pump])

    all_four_open = valves_open.size >= 4 && valves_open.first(4).all?
    safe_pressurization = all_four_open && main_pump

    {
      episode: 'EP35 - GRAFFITI (MRI Hydraulic & ECMO Aligner)',
      scanner: 'BLADES MRI DEEP TISSUE & VALVE SCANNER',
      valves_state: valves_open.first(4),
      main_pump_engaged: main_pump,
      safe_pressurization: safe_pressurization,
      status_color: safe_pressurization ? '#00F200' : '#E7F800',
      message: if safe_pressurization
                 'FLUJO LAMINAR ECMO Y ELEVADOR HIDRÁULICO ESTABILIZADO: Las 4 válvulas periféricas abrieron antes del rotor maestro.'
               elsif main_pump && !all_four_open
                 'ALERTA CRÍTICA (#E7F800): Intento de arranque de bomba maestra con válvulas periféricas cerradas. Riesgo de sobrepresión/embolia.'
               else
                 'ESCANEO MRI ACTIVO: Alinea las 4 válvulas periféricas (V1..V4) antes de energizar la bomba central.'
               end
    }
  end

  def self.solve_genius_symbols(payload)
    sequence = Array(payload['sequence'] || payload[:sequence]).map(&:to_s)
    expected = %w[BLUE_ARROW_DOWN RED_BROKEN_CIRCLE RED_SQUARE BLUE_TRIANGLE]
    unlocked = sequence == expected

    {
      episode: 'EP26 - GENIUS (HIS Logic Bomb Defusal)',
      sequence_submitted: sequence,
      logic_bomb_defused: unlocked,
      status_color: unlocked ? '#00F200' : '#E7F800',
      message: unlocked ? 'BOMBA LÓGICA DESACTIVADA EN SERVIDOR HIS: Montacargas al Nivel 2 habilitado.' : 'SECUENCIA SIMBÓLICA INCORRECTA: Peligro de descarga en consola.'
    }
  end

  def self.truthy?(val)
    [true, 'true', '1', 1, 'on', 'OPEN', 'TRUE'].include?(val)
  end
end
