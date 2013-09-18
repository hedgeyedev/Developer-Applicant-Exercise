class HomeController < ApplicationController
  def index
    @lang = params[:language]
    if @lang
      @tweets = Tweet.where(language: @lang).limit(10)
    else
      @tweets = Tweet.known.limit(20)
    end
  end

  def more_tweets
    @more_tweets = Tweet.fetch_create(10, params[:language])
    render partial: 'tweet', collection: @more_tweets
  end
end
