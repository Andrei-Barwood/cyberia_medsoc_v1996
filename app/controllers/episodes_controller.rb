# frozen_string_literal: true

require_relative 'application_controller'

class ApplicationController < Sinatra::Base
  get '/' do
    @episodes = Episode.all
    @acts = Episode.acts_summary
    @metrics = Episode.global_metrics
    @nodes = TelemetryNode.all
    @initial_episode = @episodes.first
    erb :index
  end

  get '/episodes/:id' do
    @episode = Episode.find_by_id(params[:id].to_i)
    halt 404, json_response({ error: 'Episode not found in BLADES memory bank' }, 404) unless @episode

    if request.accept?('application/json') || params[:format] == 'json'
      json_response(@episode)
    else
      @episodes = Episode.all
      @nodes = TelemetryNode.all
      erb :episode_detail
    end
  end

  namespace '/api' do
    get '/episodes' do
      results = Episode.filter(
        act: params[:act],
        protocol: params[:protocol],
        query: params[:q]
      )
      json_response({
        console: 'CYBERIA-MED // SOC Console v19.96',
        total: results.size,
        episodes: results
      })
    end

    get '/episodes/:id' do
      ep = Episode.find_by_id(params[:id].to_i)
      halt 404, json_response({ error: 'Episode not found' }, 404) unless ep
      json_response(ep)
    end

    get '/telemetry/vitals' do
      json_response(TelemetryNode.live_vitals_snapshot)
    end
  end
end
