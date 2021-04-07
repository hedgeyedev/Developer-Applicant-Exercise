# myapp.rb
require 'dotenv/load'
require 'sinatra'
require 'twitter'
require 'twitter-text'
include Twitter::TwitterText::Autolink

get '/' do
  client = initialize_twitter_client()
  @tweets = get_tweets(client)

  erb :index
end

private

def initialize_twitter_client
  client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV['CONSUMER_KEY']
    config.consumer_secret     = ENV['CONSUMER_SECRET_KEY']
    config.access_token        = ENV['ACCESS_TOKEN']
    config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
  end
end

def get_tweets(client)
  tweets = []
  client.sample do |object|
    next if object.is_a?(Twitter::Streaming::DeletedTweet)
    tweets.push(object) if object_is_a_tweet_and_in_english?(object)
    break if tweets.length == 20
  end

  tweets
end

def object_is_a_tweet_and_in_english?(object)
  object.is_a?(Twitter::Tweet) && object.lang == 'en'
end
