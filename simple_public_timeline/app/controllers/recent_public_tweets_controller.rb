class RecentPublicTweetsController < ApplicationController
  def index
    @timeline = TwitterTimeline.public_timeline
    respond_to do |format|
      format.html
      format.js { render js: @timeline}
    end
  end
end
