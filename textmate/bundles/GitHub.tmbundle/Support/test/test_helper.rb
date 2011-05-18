require "test/unit"
$:.unshift(File.dirname(__FILE__) + "/../lib")

require "pp"
require 'rubygems'
%w[mocha Shoulda].each do |gem_name|
  begin
    require gem_name
  rescue LoadError => e
    puts "You must install #{gem_name} rubygem before running these tests"
    exit
  end
end

require "git_manager"