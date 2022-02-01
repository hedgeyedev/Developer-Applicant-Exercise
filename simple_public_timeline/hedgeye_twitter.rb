require "sinatra"
require "twitter"

twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end

get "/" do
  @results = twitter_client.search("Hedgeye", result_type: "recent").take(20)

  erb :index
end

get "/via_js" do

end

get "/search.js" do
    @results = []

    search_term = params["search"] || "Hedgeye"

    twitter_client.search(search_term, result_type: "recent").take(20).collect do |tweet|
        @results << tweet.to_h
    end

    @results.to_json
end