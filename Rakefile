require 'bundler/gem_tasks'
require 'rspec/core'
require 'rspec/core/rake_task'
require 'bundler'

Bundler::GemHelper.install_tasks
RSpec::Core::RakeTask.new(:spec)
task :default => :spec
