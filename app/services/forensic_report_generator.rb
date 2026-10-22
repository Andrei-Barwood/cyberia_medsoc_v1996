# frozen_string_literal: true

require_relative '../models/episode'
require_relative '../models/telemetry_node'

class ForensicReportGenerator
  def self.generate_episode_bulletin(episode_id)
    ep = Episode.find_by_id(episode_id)
    return '# Error: Episode not found' unless ep

    v = ep.dig('pillars', 'vulnerability') || {}
    d = ep.dig('pillars', 'detection') || {}
    m = ep.dig('pillars', 'mitigation') || {}
    p = ep.dig('pillars', 'prevention') || {}

    <<~MARKDOWN
      # BOLETÍN FORENSE DE CIBERSEGURIDAD CLÍNICA — #{ep['code']}: #{ep['title']}
      **ID de Certificación:** `CYBERIA-MED-CERT-2027-#{ep['code']}`  
      **Consola Emisora:** CYBERIA-MED // SOC Console v19.96 (BLADES Neural DPI & MRI Engine)  
      **Acto Operativo:** #{ep['act']}  
      **Nodo Original Cyberia (1996):** `#{ep['game_node_code']}` — *#{ep['game_location']}*  
      **Subsistema Hospitalario Equivalente:** #{ep['hospital_counterpart']}  
      **Protocolo Clínico / Industrial:** `#{ep['clinical_protocol']}`  
      **Activo IoMT / Biomédico Afectado:** #{ep['iomt_asset']}  
      **Táctica / Técnica MITRE ATT&CK:** `#{ep['mitre_technique']}`

      ---

      ## 1. CRÓNICA FORENSE Y SPOILER NARRATIVO COMPLETO (CYBERIA 1996)
      #{ep['cyberia_spoiler']}

      ---

      ## 2. MATRIZ DE LOS 4 PILARES DE CIBERSEGURIDAD HOSPITALARIA

      ### PILAR I: ANÁLISIS DE VULNERABILIDAD CLÍNICA
      * **Identificador CVE:** `#{v['cve']}`
      * **Severidad Base CVSS v3.1:** **#{v['cvss']} / 10.0**
      * **Vector Criptográfico CVSS:** `#{v['vector']}`
      * **Diagnóstico de Ingeniería Biomédica:** #{v['description']}

      ### PILAR II: DETECCIÓN Y TELEMETRÍA (BLADES DPI / SIEM)
      * **Motor de Detección:** #{d['engine']}
      * **Identificador de Regla (YARA/Sigma):** `#{d['rule_name']}`
      * **Firma de Inspección Profunda:**
      ```text
      #{d['signature']}
      ```
      * **Indicador de Telemetría Clínica:** #{d['telemetry_indicator']}

      ### PILAR III: MITIGACIÓN Y CONTENCIÓN INMEDIATA
      * **Código de Playbook SOAR:** `#{m['action_code']}`
      * **Acción de Respuesta en Caliente:** #{m['immediate_response']}
      * **Comando de Consola Ejecutado:**
      ```bash
      #{m['cli_command']}
      ```

      ### PILAR IV: PREVENCIÓN DE INCIDENTES Y ARQUITECTURA ZERO TRUST
      * **Marco Normativo y Estándar:** #{p['standard']}
      * **Política de Hardening Biomédico:** #{p['hardening_policy']}
      * **Control Zero Trust Clínico:** #{p['zero_trust_control']}
    MARKDOWN
  end

  def self.generate_episode_stix_json(episode_id)
    ep = Episode.find_by_id(episode_id)
    return {} unless ep

    v = ep.dig('pillars', 'vulnerability') || {}
    d = ep.dig('pillars', 'detection') || {}
    m = ep.dig('pillars', 'mitigation') || {}
    p = ep.dig('pillars', 'prevention') || {}

    {
      type: 'bundle',
      id: "bundle--cyberia-medsoc-#{ep['code'].downcase}-2027",
      spec_version: '2.1',
      console: 'CYBERIA-MED // SOC Console v19.96',
      palette_standard: 'Ultimate Queen Chrysalis (#523)',
      objects: [
        {
          type: 'vulnerability',
          id: "vulnerability--#{ep['code'].downcase}-#{v['cve'].to_s.downcase}",
          name: v['cve'],
          description: v['description'],
          x_cvss_score: v['cvss'],
          x_cvss_vector: v['vector'],
          x_clinical_protocol: ep['clinical_protocol'],
          x_iomt_asset: ep['iomt_asset']
        },
        {
          type: 'indicator',
          id: "indicator--#{ep['code'].downcase}-blades-dpi",
          name: d['rule_name'],
          pattern_type: 'yara-sigma-hybrid',
          pattern: d['signature'],
          description: d['telemetry_indicator']
        },
        {
          type: 'course-of-action',
          id: "course-of-action--#{ep['code'].downcase}-mitigation",
          name: m['action_code'],
          description: m['immediate_response'],
          x_cli_playbook: m['cli_command'],
          x_prevention_standard: p['standard'],
          x_zero_trust_control: p['zero_trust_control']
        }
      ],
      episode_metadata: ep
    }
  end

  def self.generate_act_dossier(act_number)
    eps = Episode.by_act(act_number)
    act_title = Episode::ACT_NAMES[act_number.to_i] || "ACTO #{act_number}"
    avg_cvss = if eps.empty?
                 0.0
               else
                 (eps.map { |e| e.dig('pillars', 'vulnerability', 'cvss').to_f }.sum / eps.size).round(2)
               end

    header = <<~HEADER
      # DOSSIER FORENSE POR ACTO — #{act_title}
      **Consola:** CYBERIA-MED // SOC Console v19.96  
      **Total de Episodios en este Acto:** #{eps.size}  
      **Promedio de Severidad CVSS del Acto:** #{avg_cvss} / 10.0

      ---
    HEADER

    body = eps.map { |ep| generate_episode_bulletin(ep['id']) }.join("\n\n---\n\n")
    "#{header}\n#{body}"
  end

  def self.generate_full_postmortem_48
    eps = Episode.all
    metrics = Episode.global_metrics
    nodes = TelemetryNode.all

    nodes_table = nodes.map do |n|
      "| `#{n[:id]}` | #{n[:name]} | `#{n[:game_ref]}` | `#{n[:protocol]}` | **#{n[:integrity]}%** (#{n[:status]}) |"
    end.join("\n")

    header = <<~HEADER
      # EXPEDIENTE FORENSE POST-MORTEM INTEGRAL (48 EPISODIOS)
      ## CYBERIA-MED // SOC Console v19.96 — Certificación de Resiliencia Hospitalaria Suprema

      * **Operador y Huésped Simbiótico:** Zak (Implante Neuro-Óptico BLADES v19.96 fusionado con la Entidad Biomecánica Cyberia)
      * **Actores de Amenaza Erradicados:**
        1. **El Cartel Siberiano** (Mercenarios de Santos en *The Rig*, defensas árticas de Archangel y científicos de biocontención del Complejo Cyberia).
        2. **William Devlin — Traidor Ejecutivo de la First World Alliance (FWA)** (Compromiso de cuenta Root/CISO descubierto en `EP40`, neutralización de *Kill-Switch* craneal en `EP47` y desintegración orbital total en `EP48`).
      * **Episodios Auditados y Mitigados:** **#{eps.size} / 48** (100% Cobertura de los 4 Pilares Clínicos)
      * **Severidad Promedio Global CVSS:** **#{metrics[:average_cvss]} / 10.0** (#{metrics[:critical_vulnerabilities]} vulnerabilidades críticas CVSS >= 9.0)
      * **Paleta del Sistema de Diseño:** Ultimate Queen Chrysalis (MLP Vector Club #523 — `#0E1111`, `#00F200`, `#30FF00`, `#83FF65`, `#29C2DA`, `#E7F800`, `#B2E5F2`)

      ---

      ## ESTADO FINAL DE LOS 6 NODOS AZULES DE SOPORTE VITAL (EP04 SKEET SHOOT -> EP48 OMEGA)

      | ID Nodo | Subsistema Clínico Hospitalario | Referencia Cyberia (1996) | Protocolo Protegido | Integridad Final |
      | :--- | :--- | :--- | :--- | :--- |
      #{nodes_table}

      ---

      ## DESGLOSE EXHAUSTIVO DE LOS 48 EPISODIOS Y SUS 4 PILARES DE CIBERSEGURIDAD
    HEADER

    body = eps.map { |ep| generate_episode_bulletin(ep['id']) }.join("\n\n---\n\n")
    "#{header}\n\n#{body}\n"
  end
end
