class LatestTweets
  @@tweets_store ||= TweetsAuth.get_20_tweets

  def self.recent_20_tweets
    return @@tweets_store
  end

  def self.update tweets
    @@tweets_store = tweets
  end
end