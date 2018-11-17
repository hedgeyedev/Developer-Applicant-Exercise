class WelcomeController < ApplicationController
  def index
  	@tweets = TweetsStream.public_tweets
  end

  def tweetsapi
  		@tweets = TweetsStream.public_tweets
		#creating an API end point and using to render via_js
		render json: {status: "SUCCESS", message:'Loaded tweets', data:@tweets}, status: :ok
  end

end
