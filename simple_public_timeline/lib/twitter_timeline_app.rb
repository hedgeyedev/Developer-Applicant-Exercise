# frozen_string_literal: true

require 'sinatra'
require 'json'
require_relative 'services/twitter/tweet_service'
set :root, 'simple_public_timeline/lib/app'

set :port, 8080

get '/' do
  content_type :json
  { :tweets => Twitter::TweetService.new.perform }.to_json
end

get '/via_js' do
  # TODO: Need to setup webpacker and serve compiled bundle.js file in public folder to use react
  # Temporarily doing this page using ruby to generate html
  # React component with API call located at simple_public_timeline/src/components/App.js
  header_1 = '<h1>Recent Public Tweets</h1>'
  header_2 = '<h2>What everyone on Twitter is talking about</h2>'
  tweet_html = ''
  tweets = Twitter::TweetService.new.perform
  tweets.each do |tweet|
    tweet_html += '<div class="card" style="box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);transition: 0.3s;">'
    tweet_html += '<div class="container" style="padding: 2px 16px;">'
    tweet_html += "<h4><b>#{tweet[:username]}</b></h4>"
    tweet_html += "<p>#{tweet[:text]}</p>"
    tweet_html += "<footer>#{tweet[:created_at]}</footer>"
    tweet_html += "</div>"
    tweet_html += "</div>"
  end
  header_1 + header_2 + tweet_html
end
