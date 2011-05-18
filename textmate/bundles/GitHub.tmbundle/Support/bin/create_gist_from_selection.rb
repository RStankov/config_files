#!/usr/bin/env ruby

$:.unshift(File.dirname(__FILE__) + "/../lib")
require "gist"

Gist.clear
Gist.process_selection
Gist.send(ARGV[0] == "private")
