require 'tweetstream'
require 'sinatra/base'

class ApplicationController < Sinatra::Base
  get '/' do
    @tweets = tweets
    erb :index
  end

  get '/twitter_json' do
    content_type :json
    json_tweets = []
    tweets.each do |tweet|
      json_tweets << tweet.to_h.to_json
    end

    json_tweets.to_json
  end

  get '/via_js' do
    erb :twitter
  end

  def tweets
    tweets = []
    TweetStream::Client.new.sample do |status, client|
      tweets << status
      client.stop if tweets.size >= 20
    end
    tweets
  end
end
