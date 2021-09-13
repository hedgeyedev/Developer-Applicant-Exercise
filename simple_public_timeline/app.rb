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
