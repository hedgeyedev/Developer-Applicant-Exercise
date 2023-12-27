require 'sinatra'
require 'json'
require 'faraday'

get '/' do
  connection = Faraday.new(url: ENV['API_HOST'])
  response = connection.get('/1.1/statuses/status.json')

  if response.status == 200
    raw_json = response.body
    parsed_tweets = JSON.parse(raw_json)

    # Extract essential data for the view
    tweets = parsed_tweets.map do |tweet|
      {
        user: {
          name: tweet['user']['name'],
          screen_name: tweet['user']['screen_name'],
          profile_image_url: tweet['user']['profile_image_url'],
          url: tweet['user']['url']
        },
        text: tweet['text'],
        created_at: tweet['created_at'],
        source: tweet['source']
      }
    end

    erb :index, locals: { tweets: tweets }
  else
    # Handle errors
end

get '/via_js' do
  erb :via_js
end
