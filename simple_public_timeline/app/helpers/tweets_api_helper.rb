module TweetsApiHelper
  require 'tweetstream'

  def configure
    if TweetStream.options[:consumer_key].nil?
      TweetStream.configure do |config|
        config.consumer_key       = 'bWxEeBGcmtgQLeLyo2x9RcjvO'
        config.consumer_secret    = 'PKJU0OZH2faxxUGs76MyGOdt9hz5Dq3RxAnSXYYXL4yUJboPBw'
        config.oauth_token        = '1288170029968584704-d7eS4GOIPAaE82SB6nz67S0DlxqoBT'
        config.oauth_token_secret = '2BVFT8aE4ncNvozVUlBI3byIerwypVsGbGegD0s6zgOFC'
        config.auth_method        = :oauth
      end
    end
  end

  def get_tweets(num_tweets)
    # Make sure credentials have been set.
    configure

    # Initialize TweetStream and status
    tweets = []
    tweet_client = TweetStream::Client.new
    status = :ok
    status_message = t('api.v1.tweets_api.success')

    # On error, stop tweet client and save error message.
    tweet_client.on_error do |message, client|
      status = :internal_server_error
      status_message = message
      client.stop
    end

    # Gather tweets.
    tweet_client.sample do |tweet, client|
      tweets << tweet unless tweet.possibly_sensitive?
      client.stop if tweets.size >= num_tweets
    end

    [status, status_message, tweets[0..num_tweets - 1]]
  end
end
