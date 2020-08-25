module Api
  module V1
    class TweetsApiController < ApplicationController
      include TweetsApiHelper
      def tweets
        status, status_message, tweets = get_tweets(params[:num].to_i)
        render json: { message: status_message, tweets: format_tweets(tweets) }, status: status
      end

      private

      def format_tweets(tweets)
        # Function to reduce the size of the payload to only the required fields.
        # Can add more if needed, or can just return the argument if need all of them.
        needed_tweets = []
        tweets.each do |tweet|
          new_tweet = {}
          new_tweet[:user] = {}
          new_tweet[:user][:profile_image_url] = tweet.user.profile_image_url.to_s
          new_tweet[:user][:name] = tweet.user.name
          new_tweet[:user][:url] = tweet.user.url.to_s
          new_tweet[:full_text] = tweet.full_text
          new_tweet[:created_at] = tweet.created_at
          new_tweet[:source] = tweet.source
          needed_tweets << new_tweet
        end

        needed_tweets
      end
    end
  end
end
