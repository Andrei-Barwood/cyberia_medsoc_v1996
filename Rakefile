# frozen_string_literal: true

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Start CYBERIA-MED // SOC Console v19.96 server on port 4567'
task :server do
  sh 'bundle exec rackup -p 4567'
end
