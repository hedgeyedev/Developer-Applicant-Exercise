require 'sinatra'
require 'httparty'
require 'date'

get "/" do
   @tweets = HTTParty.get('http://twitter.com/statuses/public_timeline.json')
   erb :index
end

get "/via_js" do
   erb :via_js
end
