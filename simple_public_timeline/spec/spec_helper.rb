ENV['RACK_ENV'] = "test"

require './recent_tweet'
require 'rspec'
require 'rspec/mocks'
require 'rack/test'

#set :environment, :test

module RSpecMixin
  include Rack::Test::Methods
  def app
  	RecentTweet
  	#Sinatra::Application 
  end
end

RSpec.configure { |conf| conf.include RSpecMixin }

