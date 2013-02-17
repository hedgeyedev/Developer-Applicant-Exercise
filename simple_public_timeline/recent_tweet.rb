require 'bundler/setup'
require 'sinatra/base'
require 'tweetstream'
require './config/twitter_config'
require 'slim'


class RecentTweet < Sinatra::Base

	set :slim, :pretty => true
	set :public_folder, 'public'

	TweetStream.configure do |config|
		config.consumer_key       = CONSUMER_KEY
	  	config.consumer_secret    = CONSUMER_SECRET
	  	config.oauth_token        = OAUTH_TOKEN
	  	config.oauth_token_secret = OAUTH_TOKEN_SECRET
	  	config.auth_method        = AUTH_METHOD
	end

	def initialize
		super
		@session = {}
		@session[:recent_tweets] = []
		@session[:client] = TweetStream::Client.new
	end

	def most_recent_public(count)
	    @session[:client].sample do |status|
	        @session[:recent_tweets] << status
	        if @session[:recent_tweets].size >= (count * 2)
	        	@session[:recent_tweets] = @session[:recent_tweets].last(count)
	        	@session[:client].stop_stream
	        end
	    end
	    @session[:recent_tweets].last(count)
	end

	configure do
		set :most_recent_count, 20
	end

	before '/' do
		@recent_tweets = most_recent_public(settings.most_recent_count)		
	end

	get '/' do
		redirect to('/loading_tweets') unless @recent_tweets.size > 0
	  	slim :index
	end

	get '/loading_tweets' do
		sleep 3
		redirect back
	end

	get '/via_js' do
		slim :via_js
	end

	run! if app_file == $0

end
