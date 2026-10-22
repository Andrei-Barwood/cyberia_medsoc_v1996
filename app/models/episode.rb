# frozen_string_literal: true

require 'json'

class Episode
  DATA_FILES = [
    File.expand_path('../../data/episodes_part1.json', __dir__),
    File.expand_path('../../data/episodes_part2.json', __dir__),
    File.expand_path('../../data/episodes_part3.json', __dir__)
  ].freeze

  ACT_NAMES = {
    1 => 'ACTO I: PLATAFORMA OFFSHORE "THE RIG" (HOSPITAL DE CAMPAÑA MARÍTIMO Y NODO DE TRIAJE)',
    2 => 'ACTO II: RUTA DE EVACUACIÓN ÁRTICA Y TÚNELES DE SUMINISTRO (TELEMETRÍA EN TRÁNSITO)',
    3 => 'ACTO III: COMPLEJO CYBERIA - NIVEL 1 (PERÍMETRO CLÍNICO, QUIRÓFANOS LÁSER Y ADMISIONES)',
    4 => 'ACTO IV: COMPLEJO CYBERIA - NIVEL 2 (LABORATORIOS DE BIOCONTENCIÓN, GAS HALÓN Y NANOMEDICINA)',
    5 => 'ACTO V: EL NÚCLEO BIOCIBERNÉTICO Y LA REVELACIÓN DEL PROYECTO CYBERIA (SIMBIOSIS Y PURGA)',
    6 => 'ACTO VI: VENGANZA ORBITAL CONTRA DEVLIN (ERRADICACIÓN DE AMENAZA PERSISTENTE)'
  }.freeze

  class << self
    def reload!
      @episodes = nil
      all
    end

    def all
      @episodes ||= load_all_episodes
    end

    def find_by_id(id)
      all.find { |ep| ep['id'] == id.to_i }
    end

    def find_by_code(code)
      normalized = code.to_s.strip.upcase
      all.find { |ep| ep['code'].upcase == normalized || ep['game_node_code'].upcase == normalized }
    end

    def by_act(act_number)
      num = act_number.to_i
      all.select { |ep| ep['act_number'] == num }
    end

    def filter(act: nil, protocol: nil, query: nil)
      results = all
      if act && !act.to_s.strip.empty? && act.to_s != 'all'
        results = results.select { |ep| ep['act_number'].to_s == act.to_s || ep['act'].downcase.include?(act.to_s.downcase) }
      end
      if protocol && !protocol.to_s.strip.empty? && protocol.to_s != 'all'
        q_proto = protocol.to_s.downcase
        results = results.select { |ep| ep['clinical_protocol'].to_s.downcase.include?(q_proto) }
      end
      if query && !query.to_s.strip.empty?
        q = query.to_s.downcase.strip
        results = results.select do |ep|
          [
            ep['code'],
            ep['title'],
            ep['game_node_code'],
            ep['game_location'],
            ep['cyberia_spoiler'],
            ep['hospital_counterpart'],
            ep['clinical_protocol'],
            ep['iomt_asset'],
            ep['mitre_technique'],
            ep.dig('pillars', 'vulnerability', 'cve'),
            ep.dig('pillars', 'vulnerability', 'description'),
            ep.dig('pillars', 'detection', 'rule_name'),
            ep.dig('pillars', 'mitigation', 'immediate_response'),
            ep.dig('pillars', 'prevention', 'standard')
          ].compact.any? { |field| field.to_s.downcase.include?(q) }
        end
      end
      results
    end

    def search(query)
      filter(query: query)
    end

    def acts_summary
      ACT_NAMES.map do |num, name|
        eps = by_act(num)
        {
          act_number: num,
          name: name,
          episode_count: eps.size,
          episode_range: eps.empty? ? 'N/A' : "#{eps.first['code']} - #{eps.last['code']}"
        }
      end
    end

    def global_metrics
      eps = all
      cvss_scores = eps.map { |e| e.dig('pillars', 'vulnerability', 'cvss').to_f }.reject(&:zero?)
      avg_cvss = cvss_scores.empty? ? 0.0 : (cvss_scores.sum / cvss_scores.size).round(2)
      critical_count = cvss_scores.count { |s| s >= 9.0 }

      {
        total_episodes: eps.size,
        loaded_acts: eps.map { |e| e['act_number'] }.uniq.sort,
        average_cvss: avg_cvss,
        critical_vulnerabilities: critical_count,
        blades_firmware: 'v19.96-NEURAL-MRI',
        symbiosis_status: eps.size == 48 ? 'COMPLETE (ZAK // CYBERIA ENTITY)' : 'IN PROGRESS'
      }
    end

    private

    def load_all_episodes
      loaded = []
      DATA_FILES.each do |path|
        next unless File.exist?(path)

        content = File.read(path).strip
        next if content.empty?

        parsed = JSON.parse(content)
        loaded.concat(parsed) if parsed.is_a?(Array)
      end
      loaded.sort_by { |ep| ep['id'].to_i }
    end
  end
end
