# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe 'CYBERIA-MED // SOC Console v19.96 — Complete Verification Suite (Prompts 01-10)' do
  describe '1. Paleta Hexadecimal Estricta "Ultimate Queen Chrysalis (#523)"' do
    it 'sirve public/css/chrysalis_medsoc.css con todos los tokens HEX y RGBA obligatorios' do
      get '/css/chrysalis_medsoc.css'
      expect(last_response.status).to eq(200)
      css = last_response.body

      required_tokens = [
        # 1. Fondos Clínicos Oscuros (Coat)
        '#0E1111', '#121312', '#252525', '#292929', '#3D3E3D',
        # 2. Estructura de Ventanas y Navegación (Mane, Tail, Armor & Carapace)
        '#164E62', '#1A566D', '#2B87AB', '#218984', '#6CC929',
        '#00485C', '#14747E', '#409979', '#218595', '#29C2DA',
        # 3. Alertas Bio-Digitales, Escáner MRI y Telemetría Activa (Magic, Horn & Iris)
        '#00F200', '#30FF00', '#83FF65', '#A4FF8E',
        '#5B9E00', '#9DE209', '#E7F800', '#AEF504',
        '#00383B', '#093534', '#0F5150',
        # 4. Capas Translúcidas / HUD (Wings)
        '#B2E5F2', 'rgba(36, 155, 167, 0.6)', 'rgba(12, 82, 106, 0.3)'
      ]

      required_tokens.each do |token|
        expect(css).to include(token), "Falta el color obligatorio #{token} de Queen Chrysalis (#523) en el CSS"
      end
    end
  end

  describe '2. Matriz Completa de los 48 Episodios y Lore de Cyberia (1996)' do
    let(:episodes) { Episode.all }

    it 'contiene exactamente los 48 episodios numerados secuencialmente del EP01 al EP48' do
      expect(episodes.size).to eq(48)
      expect(episodes.map { |e| e['id'] }).to eq((1..48).to_a)
      expect(episodes.map { |e| e['code'] }).to eq((1..48).map { |n| format('EP%02d', n) })
    end

    it 'cubre los 6 Actos completos de principio a fin' do
      acts_summary = Episode.acts_summary
      expect(acts_summary.size).to eq(6)
      expect(Episode.by_act(1).size).to eq(12) # EP01 - EP12 (The Rig)
      expect(Episode.by_act(2).size).to eq(7)  # EP13 - EP19 (Ruta Ártica y Túnel)
      expect(Episode.by_act(3).size).to eq(8)  # EP20 - EP27 (Complejo Nivel 1)
      expect(Episode.by_act(4).size).to eq(8)  # EP28 - EP35 (Complejo Nivel 2)
      expect(Episode.by_act(5).size).to eq(9)  # EP36 - EP44 (Núcleo y Simbiosis)
      expect(Episode.by_act(6).size).to eq(4)  # EP45 - EP48 (Asalto Orbital contra Devlin)
    end

    it 'incluye todos los códigos de escena icónicos de Cyberia (1996) y spoilers exhaustivos' do
      node_codes = episodes.map { |e| e['game_node_code'] }
      iconic_nodes = [
        'FWA QUARANTINE DOCK', 'RIG DOCK', 'MEET GIA', 'SKEET SHOOT', 'BIG KISS',
        'GOING UP', 'ZAPPED', 'EASY RIDE', 'BIG SHOCK', 'OPEN OCEAN', 'CATWALK', 'STEAL PLANE',
        'ISLAND RUN', 'VALLEY RUN', 'ROUGH RIDE', 'PORT FLYBY', 'UNDERGROUND', 'PIT STOP', 'ICE SCREAM',
        'COLD FEET', 'DOOR MAN', 'LOCKED OUT', 'SLICEOMATIC', 'NOT FRIENDS', 'LISTEN IN', 'GENIUS',
        'RED LIGHT', 'DRUG STORE', 'UNSAFE DOOR', 'GRAFFITI',
        'FWA TELEMETRY LEAK', 'THE LIVING WEAPON', 'YOU WITH ME (PART 1)', 'YOU WITH ME (PART 2)',
        'COMMAND CORE BREACH', 'TOTAL THREAT ERADICATION'
      ]

      iconic_nodes.each do |node|
        expect(node_codes).to include(node)
      end

      episodes.each do |ep|
        expect(ep['cyberia_spoiler'].to_s.length).to be > 120,
          "El spoiler del episodio #{ep['code']} debe ser detallado y exhaustivo"
        expect(ep['hospital_counterpart'].to_s).not_to be_empty
        expect(ep['clinical_protocol'].to_s).not_to be_empty
        expect(ep['iomt_asset'].to_s).not_to be_empty
      end
    end

    it 'garantiza que cada uno de los 48 episodios tenga los 4 pilares clínicos obligatorios' do
      episodes.each do |ep|
        pillars = ep['pillars']
        expect(pillars).to be_a(Hash), "Faltan pilares en #{ep['code']}"

        # Pilar 1: Vulnerabilidad
        vuln = pillars['vulnerability']
        expect(vuln['cve']).to match(/\ACVE-2027-\d{4}\z/)
        expect(vuln['cvss']).to be_between(7.0, 10.0)
        expect(vuln['description'].to_s.length).to be > 30

        # Pilar 2: Detección
        det = pillars['detection']
        expect(det['engine'].to_s).not_to be_empty
        expect(det['rule_name'].to_s).not_to be_empty
        expect(det['signature'].to_s).not_to be_empty
        expect(det['telemetry_indicator'].to_s).not_to be_empty

        # Pilar 3: Mitigación
        mit = pillars['mitigation']
        expect(mit['action_code']).to start_with("MIT-#{ep['code']}")
        expect(mit['immediate_response'].to_s).not_to be_empty
        expect(mit['cli_command'].to_s).not_to be_empty

        # Pilar 4: Prevención
        prev = pillars['prevention']
        expect(prev['standard'].to_s).not_to be_empty
        expect(prev['hardening_policy'].to_s).not_to be_empty
        expect(prev['zero_trust_control'].to_s).not_to be_empty
      end
    end
  end

  describe '3. Endpoints Web y API RESTful Clínica en Sinatra' do
    it 'renderiza la consola principal GET / con los 48 episodios y los 6 nodos de soporte vital' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(last_response.headers['X-Cyberia-SOC-Version']).to eq('19.96-BLADES')
      expect(last_response.body).to include('CYBERIA-MED // SOC CONSOLE v19.96')
      expect(last_response.body).to include('48 / 48')
      expect(last_response.body).to include('NODE-01')
      expect(last_response.body).to include('NODE-06')
    end

    it 'devuelve la lista filtrable de episodios en GET /api/episodes' do
      get '/api/episodes', { act: '4' }
      expect(last_response.status).to eq(200)
      json = JSON.parse(last_response.body)
      expect(json['total']).to eq(8)
      expect(json['episodes'].first['code']).to eq('EP28')
      expect(json['episodes'].last['code']).to eq('EP35')
    end

    it 'devuelve el detalle JSON de episodios clave (EP22 LOCKED OUT, EP33 DRUG STORE, EP48 OMEGA)' do
      [22, 33, 48].each do |id|
        get "/api/episodes/#{id}"
        expect(last_response.status).to eq(200)
        ep = JSON.parse(last_response.body)
        expect(ep['id']).to eq(id)
        expect(ep['pillars'].keys).to contain_exactly('vulnerability', 'detection', 'mitigation', 'prevention')
      end
    end

    it 'entrega telemetría de signos vitales ECG en GET /api/telemetry/vitals' do
      get '/api/telemetry/vitals'
      expect(last_response.status).to eq(200)
      vitals = JSON.parse(last_response.body)
      expect(vitals['ecg_color']).to eq('#00F200')
      expect(vitals['nodes'].size).to eq(6)
    end
  end

  describe '4. Simuladores Interactivos de Puzzles (BLADES MRI & Nanomedicine EDR)' do
    it 'resuelve correctamente el puzzle de puertas lógicas MRI de EP22 (LOCKED OUT)' do
      post '/api/blades/mri-scan',
           { mode: 'locked_out_gates', input_a: true, input_b: false, input_c: true }.to_json,
           { 'CONTENT_TYPE' => 'application/json' }
      expect(last_response.status).to eq(200)
      res = JSON.parse(last_response.body)
      expect(res['solenoid_unlocked']).to be(true)
      expect(res['status_color']).to eq('#00F200')
    end

    it 'verifica el enclavamiento de las 4 válvulas hidráulicas/ECMO de EP35 (GRAFFITI)' do
      # Caso 1: Fallo por válvula cerrada al encender la bomba central
      post '/api/blades/mri-scan',
           { mode: 'graffiti_hydraulics', valves: [true, true, false, true], main_pump: true }.to_json,
           { 'CONTENT_TYPE' => 'application/json' }
      res_fail = JSON.parse(last_response.body)
      expect(res_fail['safe_pressurization']).to be(false)
      expect(res_fail['status_color']).to eq('#E7F800')

      # Caso 2: Éxito con las 4 válvulas abiertas antes de la bomba maestra
      post '/api/blades/mri-scan',
           { mode: 'graffiti_hydraulics', valves: [true, true, true, true], main_pump: true }.to_json,
           { 'CONTENT_TYPE' => 'application/json' }
      res_ok = JSON.parse(last_response.body)
      expect(res_ok['safe_pressurization']).to be(true)
      expect(res_ok['status_color']).to eq('#00F200')
    end

    it 'desactiva la bomba lógica de símbolos de la sala de conferencias EP26 (GENIUS)' do
      post '/api/blades/mri-scan',
           {
             mode: 'genius_symbols',
             sequence: %w[BLUE_ARROW_DOWN RED_BROKEN_CIRCLE RED_SQUARE BLUE_TRIANGLE]
           }.to_json,
           { 'CONTENT_TYPE' => 'application/json' }
      res = JSON.parse(last_response.body)
      expect(res['logic_bomb_defused']).to be(true)
    end

    it 'sintetiza el antídoto en EP33 (DRUG STORE) e inocula el nodo en EP34 (UNSAFE DOOR)' do
      post '/api/medsec/inoculate',
           { compound: 'ANTIDOTE-01', strain: 'CYBERIA-RANSOM-ALPHA' }.to_json,
           { 'CONTENT_TYPE' => 'application/json' }
      expect(last_response.status).to eq(200)
      res = JSON.parse(last_response.body)
      expect(res['inoculation_status']).to eq('CLEANROOM_PURGE_COMPLETE')
      expect(res['purge_token']).to eq('CYB-3334-ALPHA')
      expect(res['patient_vital_integrity']).to eq(100)
    end
  end

  describe '5. Generador de Informes Forenses Post-Mortem y Exportación STIX' do
    it 'exporta el boletín individual en Markdown y STIX 2.1 JSON' do
      get '/reports/episode/40.md'
      expect(last_response.status).to eq(200)
      expect(last_response.body).to include('EP40')
      expect(last_response.body).to include('William Devlin')

      get '/reports/episode/40.json'
      expect(last_response.status).to eq(200)
      stix = JSON.parse(last_response.body)
      expect(stix['type']).to eq('bundle')
      expect(stix['spec_version']).to eq('2.1')
    end

    it 'exporta el expediente Post-Mortem maestro de los 48 episodios en GET /reports/postmortem-full-48.md' do
      get '/reports/postmortem-full-48.md'
      expect(last_response.status).to eq(200)
      body = last_response.body
      expect(body).to include('EXPEDIENTE FORENSE POST-MORTEM INTEGRAL (48 EPISODIOS)')
      expect(body).to include('EP01:')
      expect(body).to include('EP22:')
      expect(body).to include('EP33:')
      expect(body).to include('EP48:')
      expect(body).to include('William Devlin')
    end
  end

  describe '6. Sentinela Nativo Aegis9CyberbrainEDR y Orden de Despliegue de Parches' do
    before do
      post '/api/sentinel/reset'
    end

    it 'verifica el binario Mach-O arm64 en /Users/andreibarwood/apple/fire-starter/.build/arm64-apple-macosx/debug/Aegis9CyberbrainEDR' do
      get '/api/sentinel/status', { verify_binary: 'true' }
      expect(last_response.status).to eq(200)
      status = JSON.parse(last_response.body)

      expect(status.dig('binary', 'configured_path')).to eq(
        '/Users/andreibarwood/apple/fire-starter/.build/arm64-apple-macosx/debug/Aegis9CyberbrainEDR'
      )
      expect(status.dig('binary', 'binary_present')).to be(true)
      expect(status.dig('binary', 'executable_mach_o_arm64')).to be(true)
      expect(status.dig('killchain_cli_verification', 'executed')).to be(true)
      expect(status.dig('killchain_cli_verification', 'exit_code')).to eq(0)
    end

    it 'depura reactivamente cada episodio y despliega 4 parches en orden estricto (PREVENCIÓN -> DETECCIÓN -> MITIGACIÓN -> INCIDENT RESPONSE)' do
      post '/api/sentinel/debug/1'
      expect(last_response.status).to eq(200)
      res1 = JSON.parse(last_response.body)
      patches1 = res1.dig('session', 'deployed_patches')

      expect(patches1.size).to eq(4)
      expect(patches1.map { |p| p['episode_deployment_order'] }).to eq([1, 2, 3, 4])
      expect(patches1.map { |p| p['global_deployment_order'] }).to eq([1, 2, 3, 4])
      expect(patches1.map { |p| p['classification'] }).to eq([
        'PREVENCIÓN',
        'DETECCIÓN',
        'MITIGACIÓN',
        'INCIDENT RESPONSE'
      ])

      # Al ocurrir el siguiente episodio (ej. EP22 LOCKED OUT), el orden global continúa del #5 al #8
      post '/api/sentinel/debug/22'
      expect(last_response.status).to eq(200)
      res22 = JSON.parse(last_response.body)
      patches22 = res22.dig('session', 'deployed_patches')

      expect(patches22.map { |p| p['episode_deployment_order'] }).to eq([1, 2, 3, 4])
      expect(patches22.map { |p| p['global_deployment_order'] }).to eq([5, 6, 7, 8])
      expect(res22['cumulative_patches_total']).to eq(8)
    end

    it 'permite filtrar el historial de parches desplegados por categoría en GET /api/sentinel/patches' do
      post '/api/sentinel/debug-batch', { start_id: 1, end_id: 5 }.to_json, { 'CONTENT_TYPE' => 'application/json' }
      expect(last_response.status).to eq(200)

      get '/api/sentinel/patches', { category: 'MITIGATION' }
      mit_res = JSON.parse(last_response.body)
      expect(mit_res['total_patches']).to eq(5)
      expect(mit_res['patches'].all? { |p| p['classification'] == 'MITIGACIÓN' }).to be(true)

      get '/api/sentinel/patches', { category: 'INCIDENT_RESPONSE' }
      ir_res = JSON.parse(last_response.body)
      expect(ir_res['total_patches']).to eq(5)
      expect(ir_res['patches'].all? { |p| p['classification'] == 'INCIDENT RESPONSE' }).to be(true)
    end
  end
end
