require_relative 'timeline'
require 'rspec'
require 'rack/test'
#
#RSpec.configure do |conf|
#  conf.include Rack::Test::Methods
#end

set :environment, :test

describe "Timeline" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "responds to /" do
    get '/'
    last_response.should be_ok
  end

  it "responds to /via_js" do
    get '/via_js'
    last_response.should be_ok
  end

  it 'has a headline with "Recent Public Tweets"' do
    get '/'
    last_response.should match ('Recent Public Tweets')
  end

  it 'has a smaller headline "What everyone on Twitter is talking about"' do
    get '/'
    last_response.should match ('What everyone on Twitter is talking about')
  end

  it "retrieves 20 entries from twitter's public timeline" do
    pending()
  end

  it "displays the profile image, link to users profile, tweet text, time of tweet, and source" do
    pending()
  end


end