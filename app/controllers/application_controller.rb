# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/namespace'
require 'json'
require_relative '../models/episode'
require_relative '../models/telemetry_node'
require_relative '../services/blades_scanner_service'
require_relative '../services/nanomed_inoculator_service'
require_relative '../services/forensic_report_generator'
require_relative '../services/aegis9_sentinel_service'

class ApplicationController < Sinatra::Base
  register Sinatra::Namespace

  configure do
    set :root, File.expand_path('../..', __dir__)
    set :views, File.expand_path('../views', __dir__)
    set :public_folder, File.expand_path('../../public', __dir__)
    set :protection, except: [:frame_options]
  end

  before do
    headers 'X-Cyberia-SOC-Version' => '19.96-BLADES',
            'X-Medical-Protocol-Engine' => 'HL7-FHIR-DICOM-IEEE11073-ACTIVE',
            'X-Aegis9-Sentinel-Binary' => Aegis9SentinelService::BINARY_PATH
  end

  helpers do
    def json_response(data, status_code = 200)
      content_type :json
      status status_code
      JSON.pretty_generate(data)
    end
  end
end
