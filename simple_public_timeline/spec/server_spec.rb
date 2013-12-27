require_relative '../server.rb'
require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end

describe 'Server' do
  include Rack::Test::Methods

  it 'Should load the home page' do
    get "/"
    last_response.should be_ok
  end

  it 'Should respond to ajax call' do
    get "/via_js"
    last_response.should be_ok
  end
end
