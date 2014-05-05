require 'tweetstream'
require 'json'
require 'redis'
require_relative '../config/application'

class Tweet
  CACHE_KEY = 'tweet'
  MAX_TWEETS = 20
  #5 minutes
  SECONDS_TO_EXPIRE = 300

  def initialize
    TweetStream.configure do |config|
      config.consumer_key       = APP_DATA['consumer_key']
      config.consumer_secret    = APP_DATA['consumer_secret']
      config.oauth_token        = APP_DATA['oauth_token']
      config.oauth_token_secret = APP_DATA['oauth_token_secret']
      config.auth_method        = :oauth
    end
    @redis = Redis.new
  end

  def get
    get_from_cache || get_from_twitter
  end

  private

  def get_from_twitter
    data = []
    TweetStream::Client.new.sample do |status|
      data << {
        'id' => status[:id],
        'text' => status.text,
        'username' => status.user.screen_name,
        'userid' => status.user[:id],
        'name' => status.user.name,
        'profile_image_url' => status.user.profile_image_url,
        'created_at' => status.created_at,
        'source' => status.source
      }
      break if data.length == MAX_TWEETS
    end
    set_cache data
  end

  def set_cache(data)
    @redis.set(CACHE_KEY, data.to_json)
    @redis.expire(CACHE_KEY, SECONDS_TO_EXPIRE)
    data
  end

  def get_from_cache
    data = @redis.get(CACHE_KEY)
    JSON.parse(data) if data
  end
end
