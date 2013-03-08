class TimelinesController < ApplicationController
  include TimelinesHelper
  require 'tweetstream'
  # GET /timelines
  # Get /timelines.json
  def index
    @tweets = get_tweets
    respond_to do |format|
      format.html
      format.json { render json: @tweets}
    end
  end

  # Get /via_js
  def js
    respond_to do |format|
      format.html
    end
  end
end
