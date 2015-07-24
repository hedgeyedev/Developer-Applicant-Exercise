require 'sinatra/base'
require 'kronic'
require 'twitter'

class Server < Sinatra::Base
  get '/' do
    slim :tweets, locals: { tweets: top_20_tweets }
  end

  get '/via_js' do
    slim :via_js
  end

  get '/tweets' do
    slim :tweets, locals: { tweets: top_20_tweets }, layout: false
  end

  get '/application.css' do
    scss :application
  end

  def top_20_tweets
    twitter_client.search('to:hedgeye').take(20)
  end

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = 'xaQwSNqRhM9NauNRpEVgtxa6r'
      config.consumer_secret     = 'dZTAnXkE2uTs4e8PrhPaB1rjPiqI51jdDKLwxTNeffrMb7priY'
      config.access_token        = '131903127-CgSR453T8UTu7IxAypLQzkxJxkJcglBknm3Bi9wq'
      config.access_token_secret = 'k2zgLermGzC02dgs7B4XbGWEewG63QHMEWzc1Zt6znrPr'
    end
  end

  private

  def format_date(date)
    [Kronic.format(date), 'at', date.strftime('%l:%M %p')].join(' ')
  end
end
