module TimelinesHelper
  def get_tweets
    TweetStream.configure do |config|
      config.consumer_key       = 'iXW2fg9yeqJ1MEFehkGFKw'
      config.consumer_secret    = 'AmTHg0N9zcCLEBn4Kg32N3YGllR5fwg3aeoTH4WSTA'
      config.oauth_token        = '162784302-EqvQbAfhLFpdQ34m6SDFTygwisMrJBR5UfUjKhNs'
      config.oauth_token_secret = 'NDZQvteFFDxMhqSBWUrUUVXVHCWpOmIA7Nr3Fo8nog'
      config.auth_method        = :oauth
    end

    tweets = []
    TweetStream::Client.new.sample do |status, client|
      tweets << status
      client.stop if tweets.size >= 20
    end
    tweets
  end
end
