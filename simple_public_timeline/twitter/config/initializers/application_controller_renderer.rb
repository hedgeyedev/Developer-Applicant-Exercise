# require 'omniauth'
require 'oauth'
require 'json'
require 'dotenv'
require 'tweetstream'

class TweetsStream
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
		  client.stop if @statuses.size >= 20
		end
		@statuses
	
	end

	def self.statuses
		return @statuses
	end


end





