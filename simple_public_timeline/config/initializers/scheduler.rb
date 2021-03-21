require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '5m' do
  LatestTweets::update(TweetsAuth.get_20_tweets)
end