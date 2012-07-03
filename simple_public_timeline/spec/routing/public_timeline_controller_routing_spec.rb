require "spec_helper"

describe PublicTimelineController do

  describe "index" do
  	# subject { controller }
  	
    it "should route to /public_timeline { :format => 'html' } through GET" do
      { :get => "/public_timeline"}.should route_to(:controller => 'public_timeline', :action => 'index') 
    end
    it "should not route any other action" do 
      { :get => "/public_timeline"}.should_not route_to(:controller => 'public_timeline', :action => 'show') 
      { :get => "/public_timeline"}.should_not route_to(:controller => 'public_timeline', :action => 'edit') 
      { :get => "/public_timeline"}.should_not route_to(:controller => 'public_timeline', :action => 'update') 
      { :get => "/public_timeline"}.should_not route_to(:controller => 'public_timeline', :action => 'new') 
      { :get => "/public_timeline"}.should_not route_to(:controller => 'public_timeline', :action => 'delete') 
    end
  end
  
end