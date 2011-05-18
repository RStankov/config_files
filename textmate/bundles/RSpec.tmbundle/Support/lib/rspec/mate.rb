# This is based on Florian Weber's TDDMate

ENV['TM_PROJECT_DIRECTORY'] ||= File.dirname(ENV['TM_FILEPATH'])
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/..')
require 'rspec/mate/runner'
require 'rspec/mate/options'
require 'rspec/mate/switch_command'

rspec_lib = nil

def gemfile?
  File.exist?(File.join(ENV['TM_PROJECT_DIRECTORY'], 'Gemfile'))
end

if RSpec::Mate::Options['--bundler'] || (gemfile? && !RSpec::Mate::Options['--skip-bundler'])
  require "rubygems"
  require "bundler"
  Bundler.setup
else
  candidate_rspec_lib_paths = Dir.glob(File.join(ENV['TM_PROJECT_DIRECTORY'],'vendor','{plugins,gems}','{rspec,rspec-core}{,-[0-9]*}', 'lib'))
  candidate_rspec_lib_paths << File.join(ENV['TM_RSPEC_HOME'], 'lib') if ENV['TM_RSPEC_HOME']
  rspec_lib = candidate_rspec_lib_paths.detect { |dir| File.exist?(dir) }

  $LOAD_PATH.unshift(rspec_lib) if rspec_lib
end

if RSpec::Mate::Options['--rspec-version']
  if RSpec::Mate::Options['--rspec-version'] =~ /^2/
    require 'rspec/core'
  else
    require 'spec/autorun'
  end
elsif rspec_lib
  if File.exist?(File.join(rspec_lib, 'rspec', 'core.rb'))
    require 'rspec/core'
  else
    require 'spec/autorun'
  end
else
  begin
    require 'rspec/core'
  rescue LoadError
    require 'spec/autorun'
  end
end

def rspec2?
  defined?(RSpec::Core)
end

