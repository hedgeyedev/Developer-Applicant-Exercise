# frozen_string_literal: true

require 'twitter'
module Twitter
  class TweetService
    attr_reader :client, :number_of_tweets

    def initialize
      @client = Twitter::REST::Client.new(
        consumer_key: '4Bku0Zq1wnTsZDH2Tcbk2PXwl',
        consumer_secret: '0r2YQDbUVnU9UjzhNEXBUbJmoCbvuYkl2UQNkVNAwpDKInKKFQ',
        access_token: '1432560658613084162-lfht1lOiLl4VLq6RAQE58SDlaRUL7c',
        access_token_secret: 'lAOjae6O1mHwRITgIR5SGHVkBHlmuPVmx9WJgB7k0Irmr'
      )
    end

    def perform
      formatted_tweets
    end

    private

    def formatted_tweets
      tweet_hash_list = []
      client.home_timeline.each do |tweet|
        tweet_hash_list.append({
                                 username: tweet.user.name,
                                 text: tweet.text,
                                 created_at: tweet.created_at
                               })
      end
      tweet_hash_list
    end
  end
end
