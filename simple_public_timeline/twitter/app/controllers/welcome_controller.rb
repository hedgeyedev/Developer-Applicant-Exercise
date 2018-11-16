class WelcomeController < ApplicationController
  def index
  	@tweets = TweetsStream.public_tweets
  end

  def viajs
  end

end
