require 'bundler/setup'
require 'tweetstream'
require 'haml'


module Tweets
  TweetStream.configure do |config|
    config.consumer_key       = 'c2J2sxvlpWR2It2rPsBtrQ'
    config.consumer_secret    = 'ErknEVZhXfQl0PsiFmyOB2bWWXauHARgGaVLu6HYRc'
    config.oauth_token        = '1641773640-uIf6B6AYhPnhhxebnceEZzLG3Didfn2679ITpJc'
    config.oauth_token_secret = 'nj8rXHw3S9OTm47QMtEdZsCf2H0M4j8yLqxdeazdA'
    config.auth_method        = :oauth
  end

  @client = TweetStream::Client.new
 
  def self.get count
    statuses = []

    @client.sample do |tweet,client|
      if statuses.length < count
        statuses << tweet
      end
    
      if statuses.length >= count
        client.stop
      end
    end
    
    return statuses
    
  end
end

module Display
  @templates = {}

  def self.has_renderable *template_names
    template_names.each do |name|
      
      file = File.read(name.to_s + ".haml")
      @templates[name] = Haml::Engine.new file
      
      define_singleton_method name do |vars = nil|
        @templates[name].render nil,(vars or {})
      end
      
    end
  end
  
  has_renderable :tweet,:tweet_list,:page
end