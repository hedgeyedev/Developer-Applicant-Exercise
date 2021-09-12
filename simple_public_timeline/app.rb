require 'sinatra'

require './lib/twitter_data_fetcher.rb'

get '/' do
    tweets = get_tweets()
    erb :index, :locals => { :tweets => tweets }
end
