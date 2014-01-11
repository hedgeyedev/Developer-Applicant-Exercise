require 'tweetstream'

class TwitterFetcher
  def initialize
    TweetStream.configure do |config|
      config.consumer_key       = 'XJLZ6xA3VRfKKvPyiltQ'
      config.consumer_secret    = 'Bo623m6xBRn8TYjjfSNBL44tbcsDQxQaq6jCSLA9EAw'
      config.oauth_token        = '2174349324-zpxjGAqpT1CAaEzd3o5KSKXuCecNSEV8ifBvXnj'
      config.oauth_token_secret = 'SQxRgTAVpMQzb5sFCtQFIp2b9DZL4eS6E93W63o393okz'
      config.auth_method        = :oauth
    end
  end
  
  def getTweets
    statuses = []
    TweetStream::Client.new.sample do |status, client|
      d = DateTime.parse(status.created_at.to_s)
      formatted_time = d.strftime("%A, %b %d at %I:%M:%S %p")
      temp_status = {
        text:               status.text,
        source:             status.source,
        screen_name:        status.user.screen_name,
        profile_image_url:  status.user.profile_image_url,
	created_at: 	    formatted_time
      }
      statuses << temp_status
      client.stop if statuses.size >= 20
    end
    statuses
  end
end
