require 'httparty'

class TweetLoader
  include HTTParty
  
  base_uri 'https://api.twitter.com'

  def self.tweets
    load_tweets.map{|e| Tweet.new(e) }
  end
  
  def self.load_tweets
    get('/1/statuses/public_timeline.json')
  end
end