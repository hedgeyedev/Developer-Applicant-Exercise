require 'rack/test'

require_relative '../app.rb'

describe 'Twitter Public Timeline App' do

    include Rack::Test::Methods

        def app
                TwitterPublicTimelineApp.new
        end

        it "Renders server side Twitter Public Timeline HTML View with 20 most recent Tweets" do
            get '/'
            response_body = last_response.body

            expect(last_response.status).to be(200)
            expect(response_body).to include('<h2>Recent Public Tweets</h2>')
            expect(response_body).to include('<h3>What everyone on Twitter is talking about</h3>')
            # Check whether twitter tweets table contains 20 table rows each containing a single tweet's data
            expect(response_body).to include('<tr>').exactly(20).times
        end

        it "Returns 20 most recent Tweets in response JSON format" do
            get '/tweets'
           expect(last_response.status).to be(200)
           expect(JSON.parse(last_response.body)['tweets'].length).to be (20)
        end

        # Commented out to ensure that the tests can run and pass in a consistent repeatable fashion. Running
        # this additional tests leads to the Twitter's API limit being hit yields inconsistent test execution results.

        # it "Returns user specified number of most recent Tweets in response JSON format" do
        #     num_tweets = rand(10)
        #     get "/tweets?num_tweets=#{num_tweets}"
        #    expect(last_response.status).to be(200)
        #    expect(JSON.parse(last_response.body)['tweets'].length).to be (num_tweets)
        # end

        it "Renders client side async JS Twitter Public Timeline HTML View with 20 most recent Tweets" do
            get '/via_js'
            response_body = last_response.body

            expect(last_response.status).to be(200)
            expect(response_body).to include('<span id="error-message"></span>')
            expect(response_body).to include('<h2>Recent Public Tweets</h2>')
            expect(response_body).to include('<h3>What everyone on Twitter is talking about</h3>')
        end
end
