require "bundler/gem_tasks"
require "rspec/core/rake_task"

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'teambition2'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
