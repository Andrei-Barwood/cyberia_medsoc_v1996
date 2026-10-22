# frozen_string_literal: true

class NanomedInoculatorService
  COMPOUNDS = {
    'ANTIDOTE-01' => {
      name: 'COMPOUND-ALPHA // Kernel Mutex Vaccine',
      target_strain: 'CYBERIA-RANSOM-ALPHA',
      efficacy: 100,
      purge_code: 'CYB-3334-ALPHA'
    },
    'ANTIDOTE-02' => {
      name: 'COMPOUND-BETA // DICOM Buffer Shield',
      target_strain: 'HALON-WORM-BETA',
      efficacy: 100,
      purge_code: 'CYB-3334-BETA'
    },
    'ANTIDOTE-03' => {
      name: 'COMPOUND-GAMMA // Neuro-Nanobot Purge',
      target_strain: 'DEVLIN-ROOTKIT-OMEGA',
      efficacy: 100,
      purge_code: 'CYB-3334-GAMMA'
    }
  }.freeze

  def self.synthesize_and_inoculate(payload)
    compound_id = (payload['compound'] || payload[:compound] || 'ANTIDOTE-01').to_s.upcase
    strain = (payload['strain'] || payload[:strain] || 'CYBERIA-RANSOM-ALPHA').to_s.upcase
    compound = COMPOUNDS[compound_id] || COMPOUNDS['ANTIDOTE-01']

    matched = compound[:target_strain] == strain || payload['force_purge'] == true || payload[:force_purge] == true

    {
      episodes: ['EP33 - DRUG STORE', 'EP34 - UNSAFE DOOR'],
      selected_compound: compound_id,
      compound_name: compound[:name],
      detected_strain: strain,
      neutralization_rate: matched ? 100.0 : 65.0,
      inoculation_status: matched ? 'CLEANROOM_PURGE_COMPLETE' : 'PARTIAL_CONTAINMENT',
      purge_token: compound[:purge_code],
      patient_vital_integrity: 100,
      status_color: '#00F200',
      message: "Inoculador EP34 activado con #{compound[:name]}. Cepa #{strain} erradicada del kernel de bombas de infusión UCI."
    }
  end
end
