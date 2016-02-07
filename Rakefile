require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'

namespace :spec do
  desc 'Run unit specs.'
  RSpec::Core::RakeTask.new(:unit) do |t|
  	
    # t.pattern = "spec/unit/*_spec.rb"
  end
end

desc 'Run all specs.'
task :spec => %w[spec:unit]

task :default => :spec