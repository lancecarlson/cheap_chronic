# Ensure that only the source is getting tested and not the installed gem
$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require "rubygems"
require "test/unit"
require "spec"
require File.join(File.dirname(__FILE__), "..", "lib", "cheap_chronic", "core_ext", "numeric")
require File.join(File.dirname(__FILE__), "..", "lib", "cheap_chronic")

Spec::Runner.configure do |config| 
end