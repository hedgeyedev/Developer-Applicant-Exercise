require 'twitter'

require_relative '../models/tweet.rb'

module TwitterDataFetcher
    $twitter_streaming_client = Twitter::Streaming::Client.new do |config|
        config.consumer_key        = ''
        config.consumer_secret     = ''
        config.access_token        = ''
        config.access_token_secret = ''
    end

    def self.get_tweets(num_tweets = 20)
        tweets = []

        $twitter_streaming_client.sample do |tweet|
            return tweets if tweets.length() == num_tweets

            if tweet.is_a?(Twitter::Tweet)
                tweets << Tweet.new(tweet.user.profile_image_url_https,
                                    tweet.user.name, tweet.user.url,
                                    tweet.text, tweet.created_at,
                                    tweet.source)
            end
        end
    end
end
