require "spec_helper"

describe TweetsController do  	
  it "should route to /tweets { :format => 'html' } through GET" do
    { :get => "/tweets"}.should route_to(:controller => 'tweets', :action => 'index') 
    { :get => "/tweets/via_js"}.should route_to(:controller => 'tweets', :action => 'via_js') 
  end
  
end