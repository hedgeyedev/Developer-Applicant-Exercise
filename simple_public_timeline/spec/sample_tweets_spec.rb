require 'tweetstream'
require 'twitter_filter'
require 'rspec'
require 'rack/test'
require 'yaml'
require 'json'
require_relative '../sample_tweets_app'

set :environment, :test

describe 'the SampleTweets app' do
  include Rack::Test::Methods

  let(:twenty_tweets_file) { File.expand_path("../../fixtures/tweets/twenty_tweets.yml", __FILE__) }
  let(:twenty_tweets) { Tweets.deserialize(twenty_tweets_file) }

  def app
    Sinatra::Application
  end

  before do
    GetTweets.any_instance.stub(:sample).with(20).and_return(twenty_tweets)
  end

  describe '#get_sample' do
  
    it "works" do
      get_sample.class.name.should == 'Tweets'
      get_sample.tweets.length.should == 20
    end

  end

  describe '/' do

    it "works" do
      get '/'
      last_response.should be_ok
      last_response.body.should include "Recent Public Tweets"
      last_response.body.should include "Que pecha de reir hoy en el cambio de clase"
      last_response.body.should include "bixychick"
      last_response.body.should include "1st show 11 yrs ago, good times, I'd do it all again."
    end

  end

  describe '/tweets.json' do
  
    it "returns the tweets as JSON" do
    
      header "HTTP_ACCEPT", "application/json"
      get '/tweets.json', {'Content-Type' => 'application/json'}
      last_response.should be_ok

    end
  
  end

end
