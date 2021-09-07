require 'spec_helper'
require_relative './app/controllers/application_controller'
require_relative './config/environment'
require 'rack/test'
require 'tweetstream'
require 'date'

describe 'Application Controller' do
  include Rack::Test::Methods

  def app
    ApplicationController.new
  end

  it 'displays recent public tweets for get /' do
    get '/'
    expect(last_response.body).to include('Recent Public Tweets')
  end

  it 'displays what everyone on twitter is talking aboutfor get /' do
    get '/'
    expect(last_response.body).to include('What everyone on Twitter is talking about')
  end

  it 'displays recent public tweets for get /via_js ' do
    get '/via_js'
    expect(last_response.body).to include('Recent Public Tweets')
  end

  it 'displays what everyone on twitter is talking about get /via_js' do
    get '/via_js'
    expect(last_response.body).to include('What everyone on Twitter is talking about')
  end

  it 'includes data for /twitter_json' do
    get '/twitter_json'
    expect(last_response).to be_ok
  end
end
