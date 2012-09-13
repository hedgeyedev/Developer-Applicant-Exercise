require_relative "home"
require "rack/test"

def app
	Sinatra::Application
end

describe "getPublicTimeline" do
	it "should return 20 tweets" do
		getPublicTimeline().length().should == 20
	end
end

describe "home" do
	include Rack::Test::Methods
	it "should load the page" do
		get "/"
		last_response.should be_ok
	end
end

describe "via_js" do
	include Rack::Test::Methods
	it "should load the page" do
		get "/via_js"
		last_response.should be_ok
	end
end

describe "via_js ajax" do
	include Rack::Test::Methods
	it "should load the page" do
		get "/public_timeline"
		last_response.should be_ok
	end
end