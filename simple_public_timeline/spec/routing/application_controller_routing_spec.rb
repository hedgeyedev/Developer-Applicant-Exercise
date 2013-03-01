require "spec_helper"

describe ApplicationController do

  describe "index" do
  	# subject { controller }
  	
    it "should route to / { :format => 'html' } through GET" do
        { :get => '/' }.should route_to(:controller => 'tweets', :action => 'index')   
    end
  end
  
end