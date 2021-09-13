require 'twitter'

require_relative '../models/tweet.rb'

module TwitterDataFetcher
    $twitter_streaming_client = Twitter::Streaming::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
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

    def self.get_tweets_json(num_tweets = 20)
        tweets = self.get_tweets(num_tweets)
        tweets_json = []

        tweets.each do |tweet|
            tweets_json << tweet.to_json
        end
    end
end
