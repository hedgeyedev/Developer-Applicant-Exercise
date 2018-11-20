require 'rails_helper'

describe "Welcome", type: :request do
	describe "tweetsapi" do

		let!(:tweet) do
			Twitter::Tweet.new(
				created_at: "Sun Nov 18 14:46:08 +0000 2018",
				id: 1064167880558731300,
				text: "RT @ValaAfshar: You are not your job. You are so much more. This elementary school surprised their superhero custodian",
			 	source: "<a href='http://twitter.com/download/android' rel='nofollow'>Twitter for Android</a>",
				user: {
					screen_name: "OregonFembot",
					profile_image_url_https: "https://pbs.twimg.com/profile_images/873256968269332480/YbwkX-Bu_normal.jpg"
				}
			)
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
			expect(parsed_body['tweets'][0]["id"]).to eql(1064167880558731300)
		end
		it "should return tweets" do
			get "/tweetsapi"
			parsed_body = JSON.parse(response.body)	
			expect(parsed_body['tweets'][0]["created_at"]).to eql("Sun Nov 18 14:46:08 +0000 2018")
		end
		it "should return tweets" do
			get "/tweetsapi"
			parsed_body = JSON.parse(response.body)	
			expect(parsed_body['tweets'][0]["text"]).to eql("RT @ValaAfshar: You are not your job. You are so much more. This elementary school surprised their superhero custodian")
		end
		it "should return sources" do
			get "/tweetsapi"
			parsed_body = JSON.parse(response.body)
			expect(parsed_body['tweets'][0]["source"]).to eql("<a href='http://twitter.com/download/android' rel='nofollow'>Twitter for Android</a>")
		end
		it "should return sources" do
			get "/tweetsapi"
			parsed_body = JSON.parse(response.body)
			expect(parsed_body['tweets'][0]["user"]["screen_name"]).to eql("OregonFembot")
		end
		it "should return sources" do
			get "/tweetsapi"
			parsed_body = JSON.parse(response.body)
			expect(parsed_body['tweets'][0]["user"]["profile_image_url_https"]).to eql("https://pbs.twimg.com/profile_images/873256968269332480/YbwkX-Bu_normal.jpg")
		end

	end
end
