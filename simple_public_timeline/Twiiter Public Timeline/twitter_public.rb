require 'rubygems'
require 'sinatra'
require 'tweetstream'
require 'json'

# twitter authentication

TweetStream.configure do |config|
  config.consumer_key = 'key'
  config.consumer_secret = 'secret'
  config.oauth_token = 'oauth_token'
  config.oauth_token_secret = 'oauth_secret'
  config.auth_method = :oauth
end

    # get data and process on server side, dump html to client 
    get '/' do
      erb :index
    end 
    
    # get data via ajax call and process on client side
    
    get '/via_js' do
       erb :via_js
    end

    # get data, format and dump json for consumption
    
    get '/get_tweets' do                
      erb :get_tweets, :layout => false
    end
