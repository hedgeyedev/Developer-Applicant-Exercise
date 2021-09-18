require 'sinatra'

require_relative './lib/twitter_data_fetcher.rb'

# Raise error if Twitter API credentials env variables are not set
if ( ENV['TWITTER_CONSUMER_KEY']        == nil ||
     ENV['TWITTER_CONSUMER_SECRET']     == nil ||
     ENV['TWITTER_ACCESS_TOKEN']        == nil ||
     ENV['TWITTER_ACCESS_TOKEN_SECRET'] == nil
)
    raise %q(
        Credentials to authentication to Twitter's API not configured.

        Set and export the following env variables with the appropriate values before re-running the app:
            - TWITTER_CONSUMER_KEY
            - TWITTER_CONSUMER_SECRET
            - TWITTER_ACCESS_TOKEN
            - TWITTER_ACCESS_TOKEN_SECRET
    )
end

get '/' do
    tweets = TwitterDataFetcher::get_tweets()
    erb :index, :locals => { :tweets => tweets }
end

get '/tweets' do
    content_type :json
    # If num_tweets param is not a valid integer value then default to 20 tweets
    num_tweets = params['num_tweets'].to_i <= 0 ? 20 : params['num_tweets'].to_i

    tweets_json = TwitterDataFetcher::get_tweets_json(num_tweets)
    return { tweets: tweets_json }.to_json
end

get '/via_js' do
    erb :via_js, :layout => false
end
