require_relative '../app'
require 'rack/test'
set :environment, :test

class TestTweets
  def self.tweets
    JSON(File.read(File.join(File.dirname(__FILE__), 'tweets.json')))
  end
end

class TweetLoader
  def self.load_tweets
    TestTweets.tweets
  end
end

describe 'Twitter App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  it "displays tweets from 20 users" do
    get '/'
    last_response.should be_ok
    html = last_response.body
    
    tweets = TestTweets.tweets
    tweets.each do |tweet|
      html.should include(tweet['id'].to_s)
      html.should include(tweet['id_str'])
      html.should include(Time.parse(tweet['created_at']).utc.iso8601)
      html.should include(tweet['source'])
      html.should include(TextConverter.convert(tweet['text']).strip)
    end
  end
end