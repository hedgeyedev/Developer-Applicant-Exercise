class PublicTweetsController < ApplicationController
  respond_to :html, :xml

  def index
    get_tweets
    respond_with @public_tweets
  end
  
  def via_js
    get_tweets
    respond_with @public_tweets
  end
  
  def get_tweets
    @public_tweets = []
    TweetStream::Client.new.sample(:limit => Proc.new{ |skip_count| @rate_limit_msg = "Opps!!!! you have reached the rate limit."}) do |public_tweet, client|
      @public_tweets << public_tweet
      client.stop if @public_tweets.size >= 20
    end 
    @public_tweets
    puts @public_tweets.class.to_s
    puts @public_tweets.size.to_s
    puts @public_tweets.inspect.to_s
  end
end

