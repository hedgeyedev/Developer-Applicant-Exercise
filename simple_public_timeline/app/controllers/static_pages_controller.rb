class StaticPagesController < ApplicationController
  include TweetsApiHelper
  def home
    _, _, @tweets = get_tweets(20)
  end

  def home_js; end
end
