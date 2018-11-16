class WelcomeController < ApplicationController
  def index
  	@tweets = ApiTwitter.public_tweets
  end

  def viajs
  end
  
end
