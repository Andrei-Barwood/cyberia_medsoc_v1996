# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'
require_relative '../app/controllers/application_controller'
require_relative '../app/controllers/episodes_controller'
require_relative '../app/controllers/simulators_controller'
require_relative '../app/controllers/reports_controller'
require_relative '../app/controllers/sentinel_controller'

module RSpecMixin
  include Rack::Test::Methods
  def app
    ApplicationController
  end
end

RSpec.configure do |config|
  config.include RSpecMixin
end
