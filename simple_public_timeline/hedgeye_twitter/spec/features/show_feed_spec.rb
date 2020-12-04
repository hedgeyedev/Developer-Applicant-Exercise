require "./spec/spec_helper.rb"

RSpec.describe "Viewing the server side feed" do
	it "has a main heading" do
		visit "/"
		expect(page).to have_text("Recent Public Tweets")
	end

	it "has a sub-heading" do
		visit "/"
		expect(page).to have_text("What everyone on Twitter is talking about")
	end
end