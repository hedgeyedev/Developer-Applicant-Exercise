require "spec_helper"

describe ApplicationController do

  describe "index" do
  	# subject { controller }
  	
    it "should route to /public_timline { :format => 'html' } through GET" do
        { :get => '/' }.should route_to(:controller => 'public_timeline', :action => 'index')   
    end
  end
  
end