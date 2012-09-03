require 'spec_helper'

describe "TwitterFeeds" do

  describe "Root Path" do
    it "should load and return success" do
      get root_path
      response.status.should be(200)
    end
    it "should load tweets" do
      visit '/'
      page.should have_content('via')
    end
  end

  describe "/via_js Path" do
    it "should load and return success" do
      get via_js_path
      response.status.should be(200)
    end
    it "should load tweets", :js => true do
      visit '/via_js'
      page.should have_content('via')
    end
  end

end
