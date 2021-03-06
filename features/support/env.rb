# Generated by cucumber-sinatra. (2014-10-03 11:39:27 +0100)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'lib/main.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = RPSLS

class RPSLSWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  RPSLSWorld.new
end
