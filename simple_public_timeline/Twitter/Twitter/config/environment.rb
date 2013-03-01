# Load the rails application
require File.expand_path('../application', __FILE__)
require  'rubygems'
require 'tweetstream'

# Initialize the rails application
Twitter::Application.initialize!
 require 'tweetstream'

TweetStream.configure do |config|
  config.consumer_key = 'lJ0RZaUcB3cOQgRKeAQzPg'
  config.consumer_secret = 'VJP9cuEfLetqSQ8WXbNRMnEKalnRj1g2QTZjbDOPk'
  config.oauth_token = '544364331-jI7ZQhxvFzBtGdzDJql2t3zrXHXJzblhWZ3m7lW2'
  config.oauth_token_secret = 'wXcOsCbE7S4Xy2zjGy1nd1S7siZZEkFOURfNgqj8I'
  config.auth_method = :oauth
  #config.parser   = :json
end

# This will pull a sample of all tweets based on
# your Twitter account's Streaming API role.

#TweetStream::Client.new.sample do |status|
#  # The status object is a special Hash with
#  # method access to its keys.
  #puts "#{status.text}"

#end
#@tweets=[]
#while @tweets.count < 20
#TweetStream::Client.new.sample() do |tweet|
	#@tweets << tweet.user.profile_image_url_https
 #   puts "1"
#	puts "#{tweet}"
#end
#@tweets.each do |tweet|
#	puts tweet
#end
#end