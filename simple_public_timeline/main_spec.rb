require 'rack/test'
require_relative 'main'

RSpec.describe 'Main' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context 'GET to /' do
    let(:response) { get '/' }

    it 'returns status 200 OK' do
      expect(response.status).to eq 200
    end
  end

  context 'GET to /via_js' do
    let(:response) { get '/via_js' }

    it 'returns status 200 OK' do
      expect(response.status).to eq 200
    end
  end
end
