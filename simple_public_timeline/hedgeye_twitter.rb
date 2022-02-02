require "dotenv/load"
require "sinatra"
require "twitter"

require 'dotiw'
include DOTIW::Methods

helpers do
    # There is probably an idiomatic way of putting this method into the helpers
    # but it doesn't occur to me right away.
    def dotiw(time)
        distance_of_time_in_words(Time.now, time)
    end

    # Hey! This looks familiar...
    def replace_handles_with_links(text)
        text = String.new(text)
        text.gsub!(/@([A-Z,0-9,\_,a-z]+)/) do
            "@<a href=\"https://twitter.com/#{$1}\">#{$1}</a>"
        end
    end
end

def twitter_client
  @client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token = ENV["ACCESS_TOKEN"]
    config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
  end
end

get "/" do
  @results = twitter_client.search("Hedgeye", result_type: "recent").take(20)

  erb :index, layout: :plain
end

get "/via_js" do
  erb :via_js
end

get "/search" do
  search_term = params["query"] || "Hedgeye"

  @results = twitter_client.search(search_term, result_type: "recent").take(20)

  erb "<%= @results.map { |tweet| erb :_tweet, :locals => { tweet: tweet } }.join %>"
end
