# frozen_string_literal: true

require 'bundler/setup'
require_relative 'app/controllers/application_controller'
require_relative 'app/controllers/episodes_controller'
require_relative 'app/controllers/simulators_controller'
require_relative 'app/controllers/reports_controller'
require_relative 'app/controllers/sentinel_controller'

run ApplicationController
