class TwitterTasks < Volt::Task
  def get_tweets
    require 'twitter'
    require 'time-lord'
    tweets = []

    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
    end

    client.search("from:", result_type: "recent").take(20).each do |tweet|
      tweets << {
        text: tweet.text, 
        pic_url: tweet.user.profile_image_url.to_s,
        username: tweet.user.screen_name,
        time: tweet.created_at.ago.to_words,
        device: tweet.source
      }
    end

    tweets
  end
end