require 'tweetstream'
require 'sinatra/base'

class ApplicationController < Sinatra::Base
  TweetStream.configure do |config|
    config.consumer_key = '5AzUk4AgxgM9bNQQ93mWbQS1e'
    config.consumer_secret = '1RxMU2hb2csrr18ZrZzp2DcMIWRtyOKSM7y5CU3dTIrCU2qv3l'
    config.oauth_token = '1435020993089712135-sDLmFzH4BfSwyyMKsdDjuLJcFC6kv4'
    config.oauth_token_secret = 'iXZ2KzxM1V4oOgYz2J2HpNjRQuSmhWmsE659R4uyGVl0t'
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
