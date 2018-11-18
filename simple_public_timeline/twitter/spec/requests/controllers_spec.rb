require 'rails_helper'

describe "Welcome", type: :request do
	describe "tweetsapi" do

		let!(:tweet) do
			Twitter::Tweet.new(id: 1)
		end 

		before do
			allow(TweetsStream).to receive(:public_tweets).and_return([tweet])
		end
		it "should return status" do
			get "/tweetsapi"
			parsed_body = JSON.parse(response.body)
			expect(parsed_body['status']).to eql "SUCCESS"
		end
		it "should return message" do
			get "/tweetsapi"
			parsed_body = JSON.parse(response.body)
			expect(parsed_body['message']).to eql "Loaded tweets"
		end
		it "should return tweets" do
			get "/tweetsapi"
			parsed_body = JSON.parse(response.body)
			expect(parsed_body['tweets']).to eql([{"id" => 1}])
		end
	end
end
