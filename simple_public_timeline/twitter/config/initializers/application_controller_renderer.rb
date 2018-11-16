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



class ApiTwitter
	CONSUMER_KEY = ENV['API_KEY']
	CONSUMER_SECRET = ENV['API_SECRET']
	OA_TOKEN = ENV['OAUTH_TOKEN']
	OA_SECRET = ENV['OAUTH_SECRET']
	BASE_URI = 'https://api.twitter.com/1.1/'

	def initialize
		consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { site: 'https://api.twitter.com', scheme: :header})
		token_hash = { oauth_token: OA_TOKEN, oauth_token_secret: OA_SECRET }
		@access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
	end

	def query(method_name, path, options=nil)
		JSON.parse(@access_token.request(method_name, "#{BASE_URI}#{path}", options).body)
	end

	def home_line
		response = query(:get, 'statuses/home_timeline.json')
	end


end

 a = ApiTwitter.new
 a.home_line



