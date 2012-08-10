ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = App

class AppWorld
  include Capybara
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  AppWorld.new
end