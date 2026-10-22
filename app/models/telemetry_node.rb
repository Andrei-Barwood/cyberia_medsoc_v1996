# frozen_string_literal: true

class TelemetryNode
  NODES = [
    {
      id: 'NODE-01',
      name: 'PACS / DICOM MRI Core',
      game_ref: 'EP04 SKEET SHOOT // Hull Shield 01',
      protocol: 'DICOM TLS / TCP 2762',
      integrity: 98,
      status: 'ONLINE',
      color_token: '#29C2DA'
    },
    {
      id: 'NODE-02',
      name: 'ICU Smart Infusion Cluster',
      game_ref: 'EP33 DRUG STORE // Nanomed Array',
      protocol: 'IEEE 11073-20601',
      integrity: 96,
      status: 'PROTECTED',
      color_token: '#29C2DA'
    },
    {
      id: 'NODE-03',
      name: 'HIS / EHR Master Vault',
      game_ref: 'EP26 GENIUS // Conference Supercomputer',
      protocol: 'HL7 FHIR R4 / MLLP',
      integrity: 99,
      status: 'VERIFIED',
      color_token: '#83FF65'
    },
    {
      id: 'NODE-04',
      name: 'Medical Gas & Halon SCADA',
      game_ref: 'EP28 RED LIGHT // Halon Suppression',
      protocol: 'Modbus/TCP & BACnet/IP',
      integrity: 94,
      status: 'INTERLOCKED',
      color_token: '#218595'
    },
    {
      id: 'NODE-05',
      name: 'BSL-4 Airlock & Cryo Biobank',
      game_ref: 'EP36-EP39 // Cryo & BSL-4 Core',
      protocol: 'TPM 2.0 / OPC-UA',
      integrity: 100,
      status: 'SEALED (-196°C)',
      color_token: '#83FF65'
    },
    {
      id: 'NODE-06',
      name: 'MedEvac TF-22 & BLADES Neural Link',
      game_ref: 'EP12 STEAL PLANE & EP43 YOU WITH ME',
      protocol: 'ARINC 653 / BCI Neural-TLS',
      integrity: 100,
      status: 'SYMBIOSIS ACTIVE',
      color_token: '#00F200'
    }
  ].freeze

  class << self
    def all
      NODES
    end

    def live_vitals_snapshot
      {
        timestamp: Time.now.utc.iso8601,
        operator: 'ZAK (CYBERIA BIOCYBERNETIC HOST)',
        heart_rate_bpm: 72,
        neural_sync_percent: 100.0,
        ecg_color: '#00F200',
        ring_color: '#30FF00',
        nodes: NODES
      }
    end
  end
end
