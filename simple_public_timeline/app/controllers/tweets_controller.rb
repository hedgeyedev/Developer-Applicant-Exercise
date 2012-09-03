require 'open-uri'

class TweetsController < ApplicationController
  def index
    @tweets=JSON.parse(open("https://api.twitter.com/1/statuses/public_timeline.json").read)
  end

  def via_js
    
  end

end
