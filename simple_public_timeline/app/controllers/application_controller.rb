require 'tweetstream'
require 'sinatra/base'

class ApplicationController < Sinatra::Base
  TweetStream.configure do |config|
    config.consumer_key = ''
    config.consumer_secret = ''
    config.oauth_token = ''
    config.oauth_token_secret = ''
    config.auth_method = :oauth
  end

  get '/' do
    @tweets = []

    TweetStream::Client.new.sample do |status, client|
      @tweets << status
      client.stop if @tweets.size >= 20
    end
    puts @tweets
    erb :index
  end
end
