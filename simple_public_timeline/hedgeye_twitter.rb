require "sinatra"
require "twitter"

twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key = "YPBqJoYGQzGmS5orlN4s1wqHc"
  config.consumer_secret = "VVDiYPcCSPQmzcuzHEH1v7lzV83mjaXEBjnSIF1ZUVhXAL1WrJ"
  config.access_token = "1325875417870262273-FsSEdGk422uuzU9PCoN3KUKV2TeBf3"
  config.access_token_secret = "FrW97JQc7j3VkLsXLkms58KQDsbt8iOfAPdkqvVBzgrEM"
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