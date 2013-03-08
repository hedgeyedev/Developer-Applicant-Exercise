require 'sinatra'
require 'json'
require 'twitter_filter'

set :server, %w[webrick]

get '/' do
  tweets = get_sample
  erb :index, :locals => {:tweets => tweets}
end

get '/via_js' do
  erb :blank_index
end

get '/tweets.json' do
  content_type :json
  get_sample.to_json
end

def get_sample
  gt = GetTweets.new("~/.backup_my_tweets")
  gt.sample(20)
end
