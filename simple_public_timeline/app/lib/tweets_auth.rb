require 'singleton'
require 'tweetstream'

class TweetsAuth
  include Singleton

  TweetStream.configure do |config|
    config.consumer_key       = Rails.application.secrets[:consumer_key]
    config.consumer_secret    = Rails.application.secrets[:consumer_secret]
    config.oauth_token        = Rails.application.secrets[:access_token]
    config.oauth_token_secret = Rails.application.secrets[:access_secret]
    config.auth_method        = :oauth
  end
  @@client = TweetStream::Client.new 

  def self.get_20_tweets
    tweets = []
    @@client.sample({language: 'en'}) do |status, client|
      client.stop if tweets.size >= 20
      tweets.push(status)
    end    
    tweets
  end
end