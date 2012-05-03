require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe PublicTimeline do
  context "GET /" do
    it "should assign tweet to returned json" do
      get '/'
      last_response.body.should match /var tweets = \[\{/
    end
  end

  context "GET /via_js" do
    it "should assigns tweets to null" do
      get '/via_js'
      last_response.body.should match /var tweets = null/
    end
  end
end
