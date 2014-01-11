require 'sinatra/base'
require 'json'
require_relative 'twitter_fetcher'

class TwitterApp < Sinatra::Base

  get '/' do
    @title = "Server Side"
    @statuses = TwitterFetcher.new.getTweets
    erb :index
  end

  get '/via_js' do
    @title = "Client Side JS"
    @fetch_twitter_js = true
    erb :via_js
  end

  get '/twitter_json' do
    @statuses = TwitterFetcher.new.getTweets
    @statuses.to_json
  end
end
