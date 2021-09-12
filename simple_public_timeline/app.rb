require 'sinatra'

require_relative './lib/twitter_data_fetcher.rb'

get '/' do
    tweets = TwitterDataFetcher::get_tweets()
    erb :index, :locals => { :tweets => tweets }
end
