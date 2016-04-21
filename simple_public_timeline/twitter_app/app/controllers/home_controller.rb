class HomeController < ApplicationController
	 
  def index
	  TweetStream.configure do |config|
      config.consumer_key       =  ENV["CONSUMER_KEY"]
  	  config.consumer_secret    =  ENV["CONSUMER_SECRET"]
  	  config.oauth_token        =  ENV["OAUTH_TOKEN"]
  	  config.oauth_token_secret =  ENV["OAUTH_TOKEN_SECRET"]
  	  config.auth_method        = :oauth
    end
    @clients = []
    TweetStream::Client.new.sample do |status,client|
      @clients << status
      client.stop if @clients.size >= 20
    end
  end

  def javascript_way
  	
  end
end
