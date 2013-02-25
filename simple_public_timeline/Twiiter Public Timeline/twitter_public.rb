require 'rubygems'
require 'sinatra'
require 'tweetstream'
require 'json'

# twitter authentication

TweetStream.configure do |config|
  config.consumer_key = 'm7Fdf72qEFesiVuBW1LNg'
  config.consumer_secret = 'R74pPsB0udCZ0GMrHhLo4xldRNUKoD69JR63Gjc'
  config.oauth_token = '1212101616-SXxF0TzeLmuhrpGJcRqknRq9D9FGp5rWJwi8JS0'
  config.oauth_token_secret = 'cz4rIzOvfI8mH5i1SphXMkK4OjTcubnZ25XWoOAyTY'
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