require 'sinatra'

require 'dotenv'
Dotenv.load

get '/via_js' do
  html :via_js
end

get '/' do
  require_relative 'services/twitter/api'

  client = Twitter::Api.client

  tweets = []
  
  client.sample do |object|
    if object.is_a?(Twitter::Tweet)
      tweets.push({
        source: object.source,
        url: object.url,
        user: {
          name: object.user.name,
          photo: object.user.profile_image_url_https
        },
        text: object.text,
        created_at: object.created_at
      }) 
    end

    break if tweets.count == 20
  end

  @tweets = tweets
  erb :index
end