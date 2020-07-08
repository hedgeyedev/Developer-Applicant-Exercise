require "sinatra"
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "Uj1IupsFz2mFVJykwdqr6aCQE"
  config.consumer_secret     = "dTVo3s9yIOjYv9LJ7VZTXF8b0ZCW9bTROgR7bPo9wAv1gsAsbN"
  config.access_token        = "1280571814071107585-WId025xTRT38cKvQpk7k3fYbNkHUjk"
  config.access_token_secret = "P0etij2W8XucvY2XN1WNi1F1kYkD7ZyLnpjSgp83yRxl2"
end

get "/" do
    @tweets = client.search("bloomberg", options = {result_type: "popular", count: 20})
    erb :default 
end

