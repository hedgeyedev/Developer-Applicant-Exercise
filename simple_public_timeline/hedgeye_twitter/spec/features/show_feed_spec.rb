require "./spec/spec_helper.rb"

RSpec.describe "Viewing the server side feed" do
	it "has a main headline" do
		visit "/"
		expect(page).to have_text("Recent Public Tweets")
	end
end