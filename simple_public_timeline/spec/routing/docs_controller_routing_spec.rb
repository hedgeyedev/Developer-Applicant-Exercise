require "spec_helper"

describe DocsController do

  describe "index" do
  	# subject { controller }
  	
    it "should route to /authentications { :format => 'html' } through GET" do
      { :get => "/docs"}.should route_to(:controller => 'docs', :action => 'index') 
    end
    it "should not route any other action" do 
      { :get => "/authentications"}.should_not route_to(:controller => 'authentications', :action => 'show') 
      { :get => "/authentications"}.should_not route_to(:controller => 'authentications', :action => 'edit') 
      { :get => "/authentications"}.should_not route_to(:controller => 'authentications', :action => 'update') 
      { :get => "/authentications"}.should_not route_to(:controller => 'authentications', :action => 'new') 
      { :get => "/authentications"}.should_not route_to(:controller => 'authentications', :action => 'delete') 
    end
  end
  
end