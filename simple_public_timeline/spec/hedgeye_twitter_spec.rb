require "./hedgeye_twitter"
require "rack/test"

def app
    Sinatra::Application
end

describe "Hedgeye Twitter App" do
    include Rack::Test::Methods    
    
    it "should load the application root and show some tweets" do
        # This tweet double mocks up the object returned by the Twitter gem.
        # These methods of the tweet are called in the _tweet.erb partial
        tweet = double("tweet")
        allow(tweet).to receive_message_chain("user.profile_image_uri") { "user.profile_image_uri" }
        allow(tweet).to receive_message_chain("user.url") { "user.url" }
        allow(tweet).to receive_message_chain("user.name") { "user.name" }
        allow(tweet).to receive_message_chain("created_at") { Time.now().to_s }
        allow(tweet).to receive_messages(:text => "This tweet has some text!", :source => "tweet source" )

        # Let's not hit the service every time we run our tests
        # So let's create a double for the service that returns a list of tweets.
        @twitter_client = double("twitter_client")
        allow_any_instance_of(Sinatra::Application).to receive(:twitter_client).and_return(@twitter_client)
        expect(@twitter_client).to receive(:search).and_return([tweet, tweet]) # I'm a bird!

        get "/"

        expect(last_response).to be_ok
        expect(last_response.body).to include("<span class=\"source\">tweet source</span>").twice
    end
end