require 'rspec'
require 'rspec-html-matchers'
require 'rack/test'
require 'ostruct'

require File.join(File.dirname(__FILE__), '..', 'server')

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include RSpecHtmlMatchers
end

# define factory for mocking tweets
module TwitterFactory
  def build_tweet
    OpenStruct.new(
      created_at: Time.now,
      text: 'Sample tweet.',
      source: 'web',
      user: build_user
    )
  end

  def build_user
    OpenStruct.new(
      screen_name: 'test_user',
      profile_image_uri: 'http://localhost/images/test_user.jpg',
      uri: 'http://localhost/profile/test_user'
    )
  end
end
