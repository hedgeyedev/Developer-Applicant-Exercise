require 'rack/test'
require 'rspec'

# Load Sinatra app
ENV['RACK_ENV'] = 'test'  # Set environment to 'test'
require File.expand_path('../../app.rb', __FILE__)

# Set up Rack::Test for testing Sinatra apps
module RSpecMixin
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

# Include the mixin into RSpec's configuration
RSpec.configure do |config|
  config.include RSpecMixin
end
