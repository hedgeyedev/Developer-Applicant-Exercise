require 'rack/test'
require_relative 'app.rb'

describe 'Twitter Timeline App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "loads the homepage" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Recent Public Tweets")
  end

  it "displays tweets on the homepage" do
    get '/'
    expect(last_response.body).to include("<ul>")
  end

  it "loads the JavaScript-enhanced page" do
    get '/via_js'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Recent Public Tweets")
    expect(last_response.body).to include("<script src=\"/js/fetch_tweets.js\"></script>")
  end
end