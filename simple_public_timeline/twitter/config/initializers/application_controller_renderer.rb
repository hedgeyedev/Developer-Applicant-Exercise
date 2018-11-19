require 'oauth'
require 'json'
require 'dotenv'
require 'tweetstream'
require 'tweets_stream'

TweetStream.configure do |config|
  config.consumer_key       = ENV['API_KEY']
  config.consumer_secret    = ENV['API_SECRET']
  config.oauth_token        = ENV['OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OAUTH_SECRET']
  config.auth_method        = :oauth
end
