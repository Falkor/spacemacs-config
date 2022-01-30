#!/usr/bin/env ruby
# Time-stamp: < >
########################################################################
# %f
# @author %U %a
# @description 
#
# Copyright (c) %y %U %a
# .             %o
########################################################################

# Exit cleanly from an early interrupt
Signal.trap("INT") { exit 1 }

require "thor/error"
require '%b'

# Stdout/stderr should not buffer output
$stdout.sync = true
$stderr.sync = true

begin
  %@:CLI::App.start(ARGV, :debug => true)
rescue Thor::InvocationError => e
  error e.message.gsub(/^ERROR:/, '')
end

 
