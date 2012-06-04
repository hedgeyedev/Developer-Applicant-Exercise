# require_relative only works for 1.9
require_relative 'app.rb'

require 'test/unit'
require 'rack/test'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_default
    get '/'
    assert last_response.ok?
    assert_true last_response.body.contains('Recent Public Tweets', last_response.body
  end

  def test_via_js
    get '/via_js'
    assert last_response.ok?
    assert_equal 'This is /via_js', last_response.body
  end
end
