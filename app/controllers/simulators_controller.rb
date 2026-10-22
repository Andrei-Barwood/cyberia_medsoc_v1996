# frozen_string_literal: true

require_relative 'application_controller'

class ApplicationController < Sinatra::Base
  get '/simulators' do
    @episodes = Episode.all
    @nodes = TelemetryNode.all
    erb :simulators
  end

  namespace '/api' do
    post '/blades/mri-scan' do
      payload = begin
        request.body.rewind
        body = request.body.read
        body.empty? ? params : JSON.parse(body)
      rescue StandardError
        params
      end

      result = BladesScannerService.execute_scan(payload)
      json_response(result)
    end

    post '/medsec/inoculate' do
      payload = begin
        request.body.rewind
        body = request.body.read
        body.empty? ? params : JSON.parse(body)
      rescue StandardError
        params
      end

      result = NanomedInoculatorService.synthesize_and_inoculate(payload)
      json_response(result)
    end
  end
end
