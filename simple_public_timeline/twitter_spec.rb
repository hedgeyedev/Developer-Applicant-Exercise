require_relative './twitter'
require 'rspec'
require 'rack/test'
require 'debug'

ENV['APP_ENV'] = 'test'

RSpec.describe "Twitter" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "get '/'" do 
    it "should return status 200" do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to match(/Recent Public Tweets/)
    end
    it "should return content" do
      get '/'
      expect(last_response.body).to match(/Recent Public Tweets/)
    end
  end

  describe "get '/via_js'" do 
    it "should return status 200" do
      get '/via_js'
      expect(last_response).to be_ok
    end
    it "should return content" do
      get '/via_js'
      expect(last_response.body).to match(/Recent Public Tweets/)
    end
  end
end
