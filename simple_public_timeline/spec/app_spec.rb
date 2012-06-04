require_relative '../app.rb'
require 'rspec'
require 'rack/test'

set :environment, :test

describe 'App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe '/' do
    it "respond with a basic page" do
      get '/'
      last_response.should be_ok
      last_response.body.include?('Recent Public Tweets').should be_true
    end
  end

  describe '/via_js' do
    it "should respond" do
      get '/via_js'
      last_response.should be_ok
      last_response.body.include?('via js').should be_true
    end
  end

end
