# frozen_string_literal: true

require 'digest'
require 'json'
require 'net/http'
require 'open3'
require 'time'
require_relative '../models/episode'

class Aegis9SentinelService
  PRIMARY_BINARY_PATH = '/Users/andreibarwood/apple/fire-starter/.build/arm64-apple-macosx/debug/Aegis9CyberbrainEDR'
  LOCAL_BINARY_PATH   = File.expand_path('../../bin/Aegis9CyberbrainEDR', __dir__)
  BRIDGE_URL          = 'http://127.0.0.1:9909'

  SENSOR_MAP = {
    'T1195' => {
      sensor: 'ProstheticSignatureValidator',
      phase: 'Phase 2: Access & Supply Chain',
      aegis_code: 'T1195'
    },
    'T1200' => {
      sensor: 'HardwarePortMonitor (IOKit / DiskArbitration)',
      phase: 'Phase 2: Access & Supply Chain',
      aegis_code: 'T1200'
    },
    'T1106' => {
      sensor: 'NativeAPIShield (dladdr / DYLD Guard)',
      phase: 'Phase 3: Execution & Firmware',
      aegis_code: 'T1106'
    },
    'T1542' => {
      sensor: 'FirmwareIntegrityScanner (IODeviceTree NVRAM)',
      phase: 'Phase 3: Execution & Firmware',
      aegis_code: 'T1542.001'
    },
    'T1070' => {
      sensor: 'ChronoSyncSentinel & ImmutableMemoryLedger',
      phase: 'Phase 4: Anti-Evasion & Chrono',
      aegis_code: 'T1070'
    },
    'T1014' => {
      sensor: 'RootkitAnomalyHunter (sysctl KERN_PROC_ALL)',
      phase: 'Phase 4: Anti-Evasion & Chrono',
      aegis_code: 'T1014'
    },
    'T1210' => {
      sensor: 'NeuralNetworkFirewall (NEFilterDataProvider)',
      phase: 'Phase 5: Network & C2',
      aegis_code: 'T1210'
    },
    'T1090' => {
      sensor: 'NeuralNetworkFirewall & C2 Proxy Airgap',
      phase: 'Phase 5: Network & C2',
      aegis_code: 'T1090'
    },
    'T1565' => {
      sensor: 'SynapticDataGuard (HMAC-SHA256 Stream Verifier)',
      phase: 'Phase 6: Data Integrity & DoS',
      aegis_code: 'T1565.002'
    },
    'T1498' => {
      sensor: 'ProstheticDoSWatchdog (Mach Thread Throttler)',
      phase: 'Phase 6: Data Integrity & DoS',
      aegis_code: 'T1499'
    },
    'T1499' => {
      sensor: 'ProstheticDoSWatchdog & GhostLockOrchestrator',
      phase: 'Phase 6 & 7: DoS & Ghost Lock',
      aegis_code: 'T1499'
    }
  }.freeze

  class << self
    def binary_path
      return PRIMARY_BINARY_PATH if File.exist?(PRIMARY_BINARY_PATH)

      LOCAL_BINARY_PATH
    end

    def binary_metadata
      path = binary_path
      exists = File.exist?(path)
      executable = exists && File.executable?(path)
      sha256 = exists ? Digest::SHA256.file(path).hexdigest : 'UNAVAILABLE'
      size_bytes = exists ? File.size(path) : 0

      {
        configured_path: PRIMARY_BINARY_PATH,
        resolved_path: path,
        binary_present: exists,
        executable_mach_o_arm64: executable,
        size_bytes: size_bytes,
        sha256_cdhash: sha256,
        bridge_endpoint: "#{BRIDGE_URL}/api/aegis9/resolve"
      }
    end

    def reset_state!
      @deployed_patches = []
      @debug_sessions = {}
      @global_patch_seq = 0
      @ledger_index = 0
      @last_block_hash = '0' * 64
      @last_killchain_output = nil
    end

    def deployed_patches
      @deployed_patches ||= []
    end

    def debug_sessions
      @debug_sessions ||= {}
    end

    def status_snapshot(run_binary_verification: false)
      verify_output = run_killchain_cli if run_binary_verification
      bridge_status = probe_native_bridge

      counts = {
        'PREVENCIÓN' => deployed_patches.count { |p| p[:classification] == 'PREVENCIÓN' },
        'DETECCIÓN' => deployed_patches.count { |p| p[:classification] == 'DETECCIÓN' },
        'MITIGACIÓN' => deployed_patches.count { |p| p[:classification] == 'MITIGACIÓN' },
        'INCIDENT RESPONSE' => deployed_patches.count { |p| p[:classification] == 'INCIDENT RESPONSE' }
      }

      {
        sentinel_name: 'Aegis9CyberbrainEDR // Public Security Section 9 & MedSOC Sentinel',
        status: 'ONLINE_DEBUGGING',
        binary: binary_metadata,
        native_bridge: bridge_status,
        ghost_sync_score: 100.0,
        ghost_lock_ready: true,
        episodes_debugged_count: debug_sessions.size,
        total_patches_deployed: deployed_patches.size,
        patches_by_classification: counts,
        ledger_head_index: @ledger_index || 0,
        ledger_head_sha256: @last_block_hash || ('0' * 64),
        killchain_cli_verification: verify_output || @last_killchain_output
      }
    end

    # Ejecuta el binario real `/Users/andreibarwood/apple/fire-starter/.build/arm64-apple-macosx/debug/Aegis9CyberbrainEDR --verify-killchain`
    def run_killchain_cli
      path = binary_path
      return { executed: false, error: 'Binary not found' } unless File.exist?(path)

      lines = []
      exit_code = 0

      IO.popen([path, '--verify-killchain', { err: %i[child out] }], 'r') do |io|
        while (line = io.gets)
          stripped = line.strip
          lines << stripped unless stripped.empty?
          break if stripped.include?('[ESTADO FINAL DEL GHOST]')
        end
        begin
          Process.kill('TERM', io.pid)
        rescue StandardError
          nil
        end
      end

      @last_killchain_output = {
        executed: true,
        exit_code: exit_code,
        command: "#{path} --verify-killchain",
        lines: lines,
        verified_at: Time.now.utc.iso8601
      }
    rescue StandardError => e
      { executed: false, error: e.message }
    end

    # Reacciona a un episodio (EP01..EP48), lo depura paso a paso y despliega los 4 parches en orden
    # clasificados en: PREVENCIÓN, DETECCIÓN, MITIGACIÓN e INCIDENT RESPONSE
    def debug_episode(episode_id, execute_native_cli: false)
      ep = Episode.find_by_id(episode_id.to_i)
      return nil unless ep

      @global_patch_seq ||= 0
      @ledger_index ||= 0
      @last_block_hash ||= '0' * 64

      v = ep.dig('pillars', 'vulnerability') || {}
      d = ep.dig('pillars', 'detection') || {}
      m = ep.dig('pillars', 'mitigation') || {}
      p = ep.dig('pillars', 'prevention') || {}

      sensor_info = resolve_aegis_sensor(ep['mitre_technique'])
      now_iso = Time.now.utc.iso8601

      # Si aún no se habían desplegado los parches de este episodio en la línea de tiempo actual,
      # los registramos en orden estricto (1: PREVENCIÓN, 2: DETECCIÓN, 3: MITIGACIÓN, 4: INCIDENT RESPONSE)
      existing = deployed_patches.select { |patch| patch[:episode_id] == ep['id'] }

      episode_patches = if existing.empty?
                          build_ordered_patches_for_episode(ep, v, d, m, p, sensor_info, now_iso)
                        else
                          existing
                        end

      # Intentar notificar al bridge nativo en 127.0.0.1:9909 si está escuchando
      bridge_report = notify_native_bridge_for_episode(ep, v)
      cli_trace = execute_native_cli ? run_killchain_cli : nil

      debug_steps = [
        "[AEGIS9-ATTACH] Binario '#{PRIMARY_BINARY_PATH}' acoplado al episodio #{ep['code']} (#{ep['game_node_code']}).",
        "[BREAKPOINT-CVE] Sonda activa sobre #{v['cve']} (CVSS #{v['cvss']}) en activo IoMT: #{ep['iomt_asset']} [Protocolo: #{ep['clinical_protocol']}].",
        "[SENSOR-RING-1] Módulo '#{sensor_info[:sensor]}' (#{sensor_info[:phase]}) interceptó técnica #{ep['mitre_technique']}.",
        "[PATCH-SEQ #1 -> PREVENCIÓN] Aplicada política #{p['standard']}: #{p['zero_trust_control']}",
        "[PATCH-SEQ #2 -> DETECCIÓN] Compilada regla en vivo #{d['rule_name']} en motor #{d['engine']}.",
        "[PATCH-SEQ #3 -> MITIGACIÓN] Ejecutado hot-patch #{m['action_code']} (`#{m['cli_command']}`).",
        "[PATCH-SEQ #4 -> INCIDENT RESPONSE] GhostLockOrchestrator selló bloque ##{@ledger_index} en ImmutableMemoryLedger (SHA-256: #{@last_block_hash[0, 16]}...) | Ghost Sync: 100.0%."
      ]

      session_record = {
        episode_id: ep['id'],
        episode_code: ep['code'],
        episode_title: ep['title'],
        game_node_code: ep['game_node_code'],
        act_number: ep['act_number'],
        vulnerability_cve: v['cve'],
        cvss_score: v['cvss'],
        clinical_protocol: ep['clinical_protocol'],
        iomt_asset: ep['iomt_asset'],
        aegis9_binary: PRIMARY_BINARY_PATH,
        aegis9_sensor: sensor_info[:sensor],
        aegis9_phase: sensor_info[:phase],
        mapped_aegis_mitre: sensor_info[:aegis_code],
        ghost_sync_before: (100.0 - (v['cvss'].to_f * 3.8)).round(1),
        ghost_sync_after: 100.0,
        debug_steps: debug_steps,
        deployed_patches: episode_patches,
        native_bridge_response: bridge_report,
        native_cli_verification: cli_trace,
        ledger_block_index: @ledger_index,
        ledger_block_sha256: @last_block_hash,
        debugged_at: now_iso
      }

      debug_sessions[ep['id']] = session_record
      session_record
    end

    def debug_range(start_id = 1, end_id = 48)
      (start_id.to_i..end_id.to_i).map { |id| debug_episode(id) }.compact
    end

    def filter_patches(category: nil, episode_id: nil)
      list = deployed_patches
      if episode_id && !episode_id.to_s.strip.empty?
        list = list.select { |pt| pt[:episode_id] == episode_id.to_i }
      end
      if category && !category.to_s.strip.empty? && category.to_s != 'all'
        norm = category.to_s.upcase
        list = list.select do |pt|
          pt[:category_code].upcase == norm || pt[:classification].upcase.include?(norm)
        end
      end
      list
    end

    private

    def resolve_aegis_sensor(mitre_str)
      text = mitre_str.to_s
      SENSOR_MAP.each do |prefix, info|
        return info if text.include?(prefix)
      end
      {
        sensor: 'GhostLockOrchestrator & ImmutableMemoryLedger',
        phase: 'Phase 7: Autonomous SOAR Mitigation',
        aegis_code: 'T1014 / T1499'
      }
    end

    def build_ordered_patches_for_episode(ep, v, d, m, p, sensor_info, timestamp)
      code = ep['code']
      cve  = v['cve']

      raw_Definitions = [
        {
          episode_order: 1,
          classification: 'PREVENCIÓN',
          category_code: 'PREVENTION',
          badge_color: '#29C2DA',
          patch_id: "AEGIS9-#{code}-P01-PREV",
          aegis9_module: "ProstheticSignatureValidator // #{p['standard']}",
          title: "Hardening & Zero Trust Guard (#{cve})",
          patch_description: p['hardening_policy'],
          control_applied: p['zero_trust_control'],
          cli_artifact: "aegis9-prevent --enforce-standard \"#{p['standard']}\" --lock-asset \"#{ep['iomt_asset']}\"",
          ghost_sync_delta: '+6.5%'
        },
        {
          episode_order: 2,
          classification: 'DETECCIÓN',
          category_code: 'DETECTION',
          badge_color: '#E7F800',
          patch_id: "AEGIS9-#{code}-P02-DET",
          aegis9_module: "#{sensor_info[:sensor]} // #{d['engine']}",
          title: "Inyección de Sonda & Regla #{d['rule_name']}",
          patch_description: d['telemetry_indicator'],
          control_applied: d['signature'],
          cli_artifact: "aegis9-detect --sensor \"#{sensor_info[:sensor]}\" --load-rule #{d['rule_name']}",
          ghost_sync_delta: '+8.0%'
        },
        {
          episode_order: 3,
          classification: 'MITIGACIÓN',
          category_code: 'MITIGATION',
          badge_color: '#00F200',
          patch_id: "AEGIS9-#{code}-P03-MIT",
          aegis9_module: "GhostLockOrchestrator // #{m['action_code']}",
          title: "Hot-Patch de Contención Activa (#{m['action_code']})",
          patch_description: m['immediate_response'],
          control_applied: m['cli_command'],
          cli_artifact: m['cli_command'],
          ghost_sync_delta: '+14.0%'
        },
        {
          episode_order: 4,
          classification: 'INCIDENT RESPONSE',
          category_code: 'INCIDENT_RESPONSE',
          badge_color: '#83FF65',
          patch_id: "AEGIS9-#{code}-P04-IR",
          aegis9_module: 'ImmutableMemoryLedger (SHA-256 + Curve25519) & DFIR Seal',
          title: "Sellado Forense Blockchain & Restauración Ghost Sync 100%",
          patch_description: "Aislamiento post-incidente completado en '#{ep['hospital_counterpart']}'. Evidencia de #{ep['game_node_code']} sellada en cadena inmutable contra borrado T1070.",
          control_applied: "Curve25519 Signature + WORM Ledger Block Seal for #{cve}",
          cli_artifact: "aegis9-ir --seal-ledger #{code} --cve #{cve} --restore-ghost-sync 100.0",
          ghost_sync_delta: '+9.5%'
        }
      ]

      created = raw_Definitions.map do |defn|
        @global_patch_seq += 1
        @ledger_index += 1
        block_payload = "#{@ledger_index}||#{defn[:patch_id]}||#{cve}||#{defn[:cli_artifact]}||#{@last_block_hash}"
        block_hash = Digest::SHA256.hexdigest(block_payload)
        curve_sig  = Digest::SHA256.hexdigest("CURVE25519_AEGIS9_KEY||#{block_hash}")
        @last_block_hash = block_hash

        patch_record = {
          global_deployment_order: @global_patch_seq,
          episode_deployment_order: defn[:episode_order],
          episode_id: ep['id'],
          episode_code: code,
          game_node_code: ep['game_node_code'],
          target_cve: cve,
          cvss: v['cvss'],
          clinical_protocol: ep['clinical_protocol'],
          iomt_asset: ep['iomt_asset'],
          patch_id: defn[:patch_id],
          classification: defn[:classification],
          category_code: defn[:category_code],
          badge_color: defn[:badge_color],
          aegis9_module: defn[:aegis9_module],
          title: defn[:title],
          patch_description: defn[:patch_description],
          control_applied: defn[:control_applied],
          cli_artifact: defn[:cli_artifact],
          ghost_sync_delta: defn[:ghost_sync_delta],
          ledger_block_index: @ledger_index,
          sha256_block_hash: block_hash,
          curve25519_signature: curve_sig,
          deployed_at: timestamp
        }
        deployed_patches << patch_record
        patch_record
      end

      created
    end

    def probe_native_bridge
      uri = URI.parse("#{BRIDGE_URL}/api/aegis9/status")
      http = Net::HTTP.new(uri.host, uri.port)
      http.open_timeout = 0.25
      http.read_timeout = 0.25
      res = http.get(uri.request_uri)
      if res.is_a?(Net::HTTPSuccess)
        JSON.parse(res.body).merge('bridge_mode' => 'LIVE_SOCKET_9909')
      else
        { 'status' => 'DIRECT_BINARY_COUPLED', 'bridge_mode' => 'CLI_AND_EMBEDDED_LEDGER' }
      end
    rescue StandardError
      { 'status' => 'DIRECT_BINARY_COUPLED', 'bridge_mode' => 'CLI_AND_EMBEDDED_LEDGER' }
    end

    def notify_native_bridge_for_episode(ep, vuln)
      uri = URI.parse("#{BRIDGE_URL}/api/aegis9/resolve")
      http = Net::HTTP.new(uri.host, uri.port)
      http.open_timeout = 0.25
      http.read_timeout = 0.25
      req = Net::HTTP::Post.new(uri.request_uri, { 'Content-Type' => 'application/json' })
      req.body = {
        id: "CYBERIA-#{ep['code']}-#{vuln['cve']}",
        system: ep['game_node_code'],
        region: ep['act'],
        sec: ep['act_number'] <= 2 ? 0.8 : (ep['act_number'] <= 4 ? 0.3 : -0.4),
        severity: vuln['cvss'].to_f >= 9.0 ? 'OMEGA' : 'HIGH',
        ggci: (vuln['cvss'].to_f * 10).to_i,
        ship: ep['iomt_asset'],
        corp: 'CYBERIA-MED SOC',
        cargo: [ep['clinical_protocol'], vuln['cve']],
        text: ep['cyberia_spoiler'].to_s[0, 180],
        val: "CVSS #{vuln['cvss']}"
      }.to_json
      res = http.request(req)
      res.is_a?(Net::HTTPSuccess) ? JSON.parse(res.body) : { bridge_sync: 'LOCAL_LEDGER_SEALED' }
    rescue StandardError
      { bridge_sync: 'LOCAL_LEDGER_SEALED' }
    end
  end
end
