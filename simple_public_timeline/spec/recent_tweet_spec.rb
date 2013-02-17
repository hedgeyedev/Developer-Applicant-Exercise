require_relative 'spec_helper'

Tweet = Struct.new(:text, :user, :source, :created_at)
User = Struct.new(:profile_image_url, :screen_name)

describe 'RecentTweet' do

	before(:each) do
		@recent_tweets = [
			Tweet.new("hello world", User.new("test.com", "test_tweeter"), "web", Time.now ), 
			Tweet.new("I haz cheezburger", User.new("test.com", "lolcat"), "iPhone", Time.now)
		]
	  	RecentTweet.any_instance.stub(:most_recent_public).and_return(@recent_tweets)
	end

	describe "get root_path" do
		it "should display the most recent tweets" do
	    	get '/'
	    	last_response.should be_ok
	    	last_response.body.should include('Recent Public Tweets')
	    	last_response.body.should include(
	    		('<a href="http://twitter.com/test_tweeter" class="profile-name">test_tweeter</a> <span class="status_text">hello world</span>')
	    	)
	    	last_response.body.should include(
	    		'<a href="http://twitter.com/lolcat" class="profile-name">lolcat</a> <span class="status_text">I haz cheezburger</span>'
	    	)
		end
	end

	describe "get /via_js" do
		it "should load the most recent tweets via javascript" do
			get '/via_js'
			last_response.should be_ok
	    	last_response.body.should include('Recent Public Tweets (now with Javascript!)')
	    end
	end
end