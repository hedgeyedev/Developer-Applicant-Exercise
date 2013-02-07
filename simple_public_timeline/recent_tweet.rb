require 'bundler/setup'
require 'sinatra/base'
require 'tweetstream'
require './config/twitter_config'


class RecentTweet < Sinatra::Base

	TweetStream.configure do |config|
		config.consumer_key       = CONSUMER_KEY
	  	config.consumer_secret    = CONSUMER_SECRET
	  	config.oauth_token        = OAUTH_TOKEN
	  	config.oauth_token_secret = OAUTH_TOKEN_SECRET
	  	config.auth_method        = AUTH_METHOD
	end

	@most_recent_count = 20

	def self.most_recent_public(count)
	    statuses = []
	    TweetStream::Client.new.sample do |status, client|
	        # puts status.text
	        statuses << status
	        client.stop if statuses.size >= count
	    end
	    statuses.first(count)
	end

	
	recent_tweets = self.most_recent_public(@most_recent_count)

	get '/' do
	  @recent_tweets = recent_tweets
	  erb :index
	end

	run! if app_file == $0

end
