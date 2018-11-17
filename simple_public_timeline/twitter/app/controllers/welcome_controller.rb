class WelcomeController < ApplicationController
before_action :find_tweets

  def index
  end

  def tweetsapi
	render json: {status: "SUCCESS", message:'Loaded tweets', data:@tweets}, status: :ok
  end

  def bonus
  end

  private
  def find_tweets
  	@tweets = TweetsStream.public_tweets
  end

end
