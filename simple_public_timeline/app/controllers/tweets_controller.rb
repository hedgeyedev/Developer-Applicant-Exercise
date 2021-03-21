#https://developer.twitter.com/en/docs/twitter-api/data-dictionary/object-model/tweet
class TweetsController < ApplicationController
  before_action :latest_tweets
  layout "tweets_list"
  
  def index
  end

  def via_js
    respond_to do |format|
      format.json { render json: @tweets }
      format.html
    end
  end

  private
  def latest_tweets
    @tweets = LatestTweets::recent_20_tweets
  end
end
