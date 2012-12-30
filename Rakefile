#!/usr/bin/env rake
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
require "bundler/gem_tasks"

desc "Open an irb session preloaded with this library"
task :console do
    sh "irb -rubygems -Ilib -Ispec -rdirectory_maid -rautoload"
end
