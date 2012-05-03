class PublicTimeline < Sinatra::Base
  TWITTER_URL = "http://api.twitter.com/1/statuses/public_timeline.json"
  get "/?:via_js?" do
    # Don't fetch tweets is request is to /via_js
    tweets = params[:via_js] == "via_js" ? nil : HTTParty.get(TWITTER_URL).body
    erb :timeline, { layout: :layout }, { tweets: tweets }
  end
end
