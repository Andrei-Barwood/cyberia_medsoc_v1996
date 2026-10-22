# frozen_string_literal: true

require_relative 'application_controller'

class ApplicationController < Sinatra::Base
  get '/reports/episode/:id.md' do
    ep = Episode.find_by_id(params[:id].to_i)
    halt 404, 'Episode not found' unless ep

    content_type 'text/markdown; charset=utf-8'
    attachment "CYBERIA_MEDSOC_#{ep['code']}_FORENSIC_BULLETIN.md"
    ForensicReportGenerator.generate_episode_bulletin(ep['id'])
  end

  get '/reports/episode/:id.json' do
    ep = Episode.find_by_id(params[:id].to_i)
    halt 404, json_response({ error: 'Episode not found' }, 404) unless ep

    content_type :json
    attachment "CYBERIA_MEDSOC_#{ep['code']}_STIX_IOC.json"
    JSON.pretty_generate(ForensicReportGenerator.generate_episode_stix_json(ep['id']))
  end

  get '/reports/act/:act_num.md' do
    content_type 'text/markdown; charset=utf-8'
    attachment "CYBERIA_MEDSOC_ACT_0#{params[:act_num]}_DOSSIER.md"
    ForensicReportGenerator.generate_act_dossier(params[:act_num].to_i)
  end

  get '/reports/postmortem-full-48.md' do
    content_type 'text/markdown; charset=utf-8'
    attachment 'CYBERIA_MEDSOC_FULL_48_EPISODES_POSTMORTEM.md'
    ForensicReportGenerator.generate_full_postmortem_48
  end
end
