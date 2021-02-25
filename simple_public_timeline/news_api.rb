require 'news-api'
require 'dotenv/load'

class NewsApi
  attr_reader :news_api

  def self.init_api
    @newsapi = News.new(ENV['NEWS_API_KEY'])
  end

  def self.top_headlines country, category, page_size
    NewsApi.init_api if @news_api.nil?
    response = @newsapi.get_top_headlines(country: country, category: category, pageSize: page_size)
  end
end