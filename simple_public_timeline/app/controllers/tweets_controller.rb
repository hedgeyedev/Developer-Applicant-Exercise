class TweetsController < ApplicationController
	def index
    @tweets = TwitterTimeline.pull_data
	end
	
	def via_js 
  end
end