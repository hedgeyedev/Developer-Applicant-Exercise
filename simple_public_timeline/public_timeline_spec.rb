ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'bundler'
require 'json'

Bundler.require

require './app.rb'

describe 'Public Twitter timeline' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "loads the page" do
    get '/'
    expect(last_response).to be_ok
  end

  it "Direct page has tweets" do
    get '/'
    expect(last_response.body).to match(/class="tweet"/)
  end

  it "returns valid JSON of 20 tweets" do
    get '/get20'
    expect(last_response).to be_ok
    expect(JSON.parse(last_response.body).length).to eql(20)
  end

end
