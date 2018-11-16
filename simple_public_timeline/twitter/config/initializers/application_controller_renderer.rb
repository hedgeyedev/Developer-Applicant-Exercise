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


# 	def initialize
# 		 consumer = OAuth::Consumer.new("CONSUMER_KEY", "CONSUMER_SECRET", { :site => "https://api.twitter.com", :scheme => :header })
# 		 token_hash = { :oauth_token => OA_TOKEN, :oauth_token_secret => OA_SECRET }
# 		 @access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
# 	end

# 	def query(method_name, path, options=nil)
# 		JSON.parse(@access_token.request(method_name, "#{BASE_URI}#{path}", options).body)
# 	end

# 	def home_line 
# 		response = query(:get, 'statuses/home_timeline.json')	
# 	end

# end

# a = ApiTwitter.new
# a.home_line

class ApiTwitter
	CONSUMER_KEY = ENV['API_KEY']
	CONSUMER_SECRET = ENV['API_SECRET']
	OA_TOKEN = ENV['OAUTH_TOKEN']
	OA_SECRET = ENV['OAUTH_SECRET']
	BASE_URI = 'https://api.twitter.com/1.1/'

	def self.public_tweets
		client.user_timeline("BBCNews", count:1, exclude_replies: true)
	end

	def self.client
		@client ||= Twitter::REST::Client.new do |config|
			config.consumer_key = CONSUMER_KEY
			config.consumer_secret = CONSUMER_SECRET
		end
	end


end

