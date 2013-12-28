require 'redis'
require 'json'

class BirdHouse
  
  REDIS_KEY = 'tweets'
  TWEET_MAX = 20
  
  def initialize
    @db = Redis.new
    @tweet_count = 0
  end

  def tweets(limit=20)
    tweets = []
    @db.lrange(REDIS_KEY, 0, limit - 1).collect { |x| tweets << JSON.parse(x)}
    puts "#{tweets.size}"
    tweets
  end
  
  def push_tweet(data)

    # If the tweet count is too large, trim the list
    if @tweet_count >= 100
      puts "Tweet Count is now too large #{@tweet_count}"
      @db.ltrim(REDIS_KEY, 0, 19)
      @tweet_count = 0
    end
  
    @tweet_count += 1

    length = @db.lpush(REDIS_KEY, data.to_json)
    puts "Length of List: #{length}"
    
  end
  
end
