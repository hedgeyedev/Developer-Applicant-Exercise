class TweetsController < ApplicationController
  def index
    @tweets = TweetFetcher.fetch
    handle_empty_tweets if @tweets.empty?
  rescue TweetFetcher::FetchError => e
    flash[:error] = e.message
    @tweets = []
  end

  def via_js
    # This action will be handled via JavaScript
  end

  private

  def handle_empty_tweets
    flash[:notice] = 'No tweets available at the moment.'
  end
end
