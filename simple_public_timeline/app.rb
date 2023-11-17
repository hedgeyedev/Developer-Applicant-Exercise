# frozen_string_literal: true

require 'sinatra/base'
require 'json'
require 'erb'
require 'uri'
require 'net/http'
require_relative './fake_twitter_api'
require 'bundler'
Bundler.require

# Main class
class App < Sinatra::Base
  get '/' do
    @tweets_response = []
    @count = params['count'] || 20
    result = FakeTwitterApi.new.fetch_fake_tweets(@count)
    @tweets_response = JSON.parse(result)
    erb :timeline, {
      locals: { params: params, tweets: @tweets_response },
      layout: :layout
    }
  end

  get '/via_js' do
    @tweets_response = []
    @count = params['count'] || 20
    result = FakeTwitterApi.new.fetch_fake_tweets(@count)
    @tweets_response = JSON.parse(result)
    erb :timeline_js, {
      locals: { params: params },
      layout: :layout
    }
  end

  post '/tweetList' do
    @tweets = []
    @count = params['count'] || 20
    result = FakeTwitterApi.new.fetch_fake_tweets(@count)
    @tweets = JSON.parse(result)
    erb :tweet_list, {
      locals: { params: params, tweets: @tweets }
    }
  end

  get '/timeline' do
    content_type :json
    @tweets_response = []
    @count = params['count'] || 20
    FakeTwitterApi.new.fetch_fake_tweets(@count)
  end
end
