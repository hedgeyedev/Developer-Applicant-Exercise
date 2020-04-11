set :views, File.dirname(__FILE__) + '/views'
include ActionView::Helpers::DateHelper
TWITTER_TIMELINE_USER = 'codewisdom'

get '/' do
  @tweets = twitter_client.user_timeline(TWITTER_TIMELINE_USER)
  haml :index
end

get '/via-js' do
  haml :index
end

get '/tweets' do
  tweets = twitter_client.user_timeline(TWITTER_TIMELINE_USER)
  haml :_timeline, locals: {tweets: tweets}, layout: false
end

private

def twitter_client
  @twitter_client ||= Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
    config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
  end
end
