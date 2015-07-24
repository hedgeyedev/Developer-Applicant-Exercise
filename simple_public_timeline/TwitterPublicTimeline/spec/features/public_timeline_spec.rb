require "rails_helper"

RSpec.feature "Public Timeline", :type => :feature do
  scenario "Visiting the home page to ensure 20 tweets" do
    visit "/"
    expect(page).to have_selector('li', count: 20)
  end
end
