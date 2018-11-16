# require 'omniauth'
require 'oauth'
require 'json'
require 'dotenv'


# class ApiTwitter
# 	CONSUMER_KEY = ENV['API_KEY']
# 	CONSUMER_SECRET = ENV['API_SECRET']
# 	OA_TOKEN = ENV['OAUTH_TOKEN']
# 	OA_SECRET = ENV['OAUTH_SECRET']
# 	BASE_URI = 'https://api.twitter.com/1.1/'

# 	def self.public_tweets
# 		client.user_timeline("BBCNews", count:1, exclude_replies: true)
# 	end

# 	def self.client
# 		@client ||= Twitter::REST::Client.new do |config|
# 			config.consumer_key = CONSUMER_KEY
# 			config.consumer_secret = CONSUMER_SECRET
# 		end
# 	end


# end

# a = ApiTwitter.new
# a.home_line

require 'tweetstream'

class TweetsStream
  # config.consumer_key       = ENV['API_KEY']
  # config.consumer_secret    = ENV['API_SECRET']
  # config.oauth_token        = ENV['OAUTH_TOKEN']
  # config.oauth_token_secret = ENV['OAUTH_SECRET']
  # config.auth_method        = :oauth


# This will pull a sample of all tweets based on
# your Twitter account's Streaming API role.

TweetStream.configure do |config|
  config.consumer_key       = ENV['API_KEY']
  config.consumer_secret    = ENV['API_SECRET']
  config.oauth_token        = ENV['OAUTH_TOKEN']
  config.oauth_token_secret = ENV['OAUTH_SECRET']
  config.auth_method        = :oauth
end

	def self.client
		@client ||= TweetStream::Client.new 
	end



	def self.public_tweets
		@statuses = []
		client.sample do |status|
		  # The status object is a special Hash with
		  # method access to its keys.
		  @statuses << status
		  client.stop if @statuses.size >= 10
		end
		@statuses
	
	end

	def self.statuses
		return @statuses
	end


end

# @client = TweetsStream.new



