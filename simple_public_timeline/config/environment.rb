require 'bundler'
require 'bundler/setup'
require 'tweetstream'

Bundler.require

TweetStream.configure do |config|
  config.consumer_key = ''
  config.consumer_secret = ''
  config.oauth_token = ''
  config.oauth_token_secret = ''
  config.auth_method = :oauth
end

require_all 'app'
