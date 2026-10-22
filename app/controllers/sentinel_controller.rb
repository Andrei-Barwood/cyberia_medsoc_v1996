# frozen_string_literal: true

require_relative 'application_controller'
require_relative '../services/aegis9_sentinel_service'

class ApplicationController < Sinatra::Base
  namespace '/api/sentinel' do
    # Estado global del Sentinela Aegis9CyberbrainEDR y conteo de parches por categoría
    get '/status' do
      run_cli = params[:verify_binary] == 'true'
      json_response(Aegis9SentinelService.status_snapshot(run_binary_verification: run_cli))
    end

    # Depuración reactiva de un episodio específico (EP01..EP48) por el Sentinela
    get '/debug/:episode_id' do
      run_cli = params[:verify_binary] == 'true'
      session = Aegis9SentinelService.debug_episode(params[:episode_id].to_i, execute_native_cli: run_cli)
      halt 404, json_response({ error: 'Episode not found for Aegis9 Sentinel' }, 404) unless session

      json_response({
        sentinel: 'Aegis9CyberbrainEDR',
        binary_path: Aegis9SentinelService::BINARY_PATH,
        session: session,
        cumulative_patches_total: Aegis9SentinelService.deployed_patches.size,
        cumulative_patches: Aegis9SentinelService.deployed_patches
      })
    end

    post '/debug/:episode_id' do
      payload = begin
        request.body.rewind
        body = request.body.read
        body.empty? ? {} : JSON.parse(body)
      rescue StandardError
        {}
      end

      run_cli = payload['verify_binary'] == true || params[:verify_binary] == 'true'
      session = Aegis9SentinelService.debug_episode(params[:episode_id].to_i, execute_native_cli: run_cli)
      halt 404, json_response({ error: 'Episode not found for Aegis9 Sentinel' }, 404) unless session

      json_response({
        sentinel: 'Aegis9CyberbrainEDR',
        binary_path: Aegis9SentinelService::BINARY_PATH,
        session: session,
        cumulative_patches_total: Aegis9SentinelService.deployed_patches.size,
        cumulative_patches: Aegis9SentinelService.deployed_patches
      })
    end

    # Lista cronológica de todos los parches desplegados a medida que ocurren los episodios
    # Filtrable por ?category=PREVENTION|DETECTION|MITIGATION|INCIDENT_RESPONSE o ?episode_id=
    get '/patches' do
      patches = Aegis9SentinelService.filter_patches(
        category: params[:category],
        episode_id: params[:episode_id]
      )
      json_response({
        sentinel: 'Aegis9CyberbrainEDR',
        binary_path: Aegis9SentinelService::BINARY_PATH,
        total_patches: patches.size,
        patches: patches
      })
    end

    # Depuración en lote secuencial (ej. cuando se simula una ráfaga de episodios en orden)
    post '/debug-batch' do
      payload = begin
        request.body.rewind
        body = request.body.read
        body.empty? ? {} : JSON.parse(body)
      rescue StandardError
        {}
      end

      start_id = (payload['start_id'] || params[:start_id] || 1).to_i
      end_id   = (payload['end_id'] || params[:end_id] || 48).to_i
      sessions = Aegis9SentinelService.debug_range(start_id, end_id)

      json_response({
        sentinel: 'Aegis9CyberbrainEDR',
        episodes_debugged: sessions.size,
        total_patches_deployed: Aegis9SentinelService.deployed_patches.size,
        patches: Aegis9SentinelService.deployed_patches
      })
    end

    # Reinicia el libro mayor de parches del Sentinela al bloque Génesis (#0)
    post '/reset' do
      Aegis9SentinelService.reset_state!
      json_response({
        sentinel: 'Aegis9CyberbrainEDR',
        status: 'LEDGER_RESET_TO_GENESIS',
        total_patches_deployed: 0
      })
    end
  end
end
