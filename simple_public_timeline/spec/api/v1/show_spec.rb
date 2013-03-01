describe 'GET /api/v1/projects/:id', :type => :api do
	let(:url) { "/api/v1/examples"}
	
	after(:all) { Example.delete_all }

	context "when example exists" do
	  before(:each) do 
	    @example = FactoryGirl.create(:example)
	    get (url + "/#{@example.id}")
    end
	  
	  
	  it "should check which attributes are turned" do
			last_response.status.should eq(200)
  		last_response.content_type.should include("application/json")
  		
	    @response = JSON.parse(last_response.body)	    
	    @response['status'].should eq 'found'
      @response['example']['name'].should_not be_nil
      @response['example']['user'].should_not be_nil
      @response['example']['description'].should_not be_nil
      @response['example']['project'].should_not be_nil
      @response['example']['revision'].should_not be_nil
      @response['example']['email'].should be_nil
      @response['example']['id'].should be_nil
      @response['example']['updated_at'].should be_nil
      @response['example']['created_at'].should be_nil
    end
	  it "should check for resource and status text match" do
			last_response.status.should eq(200)
  		last_response.content_type.should include("application/json")
  		
	    @response = JSON.parse(last_response.body)	    
	    @response['status'].should eq 'found'
	    @response['example']['name'].should eq "Generic Example"
	    @response['example']['user'].should eq  @example.user
      @response['example']['description'].should eq "Generic Example, tests for issues that may be caused by the testing framework and its componenets"
      @response['example']['project'].should eq "SimplePublicTimeline"
      @response['example']['revision'].should eq 1
      @response['example']['email'].should be_nil
      @response['example']['id'].should be_nil
      @response['example']['updated_at'].should be_nil
      @response['example']['created_at'].should be_nil
    end
    it "should check the response body with a JSON representation of :example resource" do
      last_response.body.should be_json_eql({:example => @example, :status => "found"}.to_json(:except => [:email, :_id]))
    end
    it "should check the response body with a JSON representation of :example resource that doesn't match" do
      @example.name = "Incorrect Name"
      last_response.body.should_not be_json_eql({:example => @example, :status => "found"}.to_json(:except => [:email, :_id]))
    end
    
  end
  context "when example doesn't exist" do
	
    it "should return error" do
	    get (url + "/4fbfb2011bd7534242000005")
			last_response.status.should eq(400)
  		last_response.content_type.should include("application/json")
      
	    @response = JSON.parse(last_response.body)
	    @response['status'].should eq 'failed'
	    @response['error'].should eq("record_not_found")
      @response['errors'].should eq("Document not found for class Example with id(s) 4fbfb2011bd7534242000005.")
      @response['code'].should eq(12)
      @response['message'].should include("Record Not Found deals")      
    end

    it "should return error for non-integer id" do
	    get (url + "/random_data")
			last_response.status.should eq(400)
  		last_response.content_type.should include("application/json")
      
	    @response = JSON.parse(last_response.body)
	    @response['status'].should eq 'failed'
	    @response['error'].should eq("invalid_find")
      @response['errors'].should eq("illegal ObjectId format: random_data")
      @response['code'].should eq(10)
      @response['message'].should include("Passed in id is not formatted correctly")      
    end
  end
  
end