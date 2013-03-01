describe 'PUT /api/v1/projects/:id', :type => :api do
  let(:url) { "/api/v1/examples/#{@example.id}"}

  before(:each) { @example = FactoryGirl.create(:example) }
  after(:each) { Example.delete_all }
  after(:all) { Example.delete_all }

  context "when data valid" do

    it "should check resource for updated attribute name" do
      @example.name = "New Example Name"
	    put url, :example =>  @example.attributes.black_list('id', 'email') 
	    last_response.status.should eq 200
	    last_response.content_type.should include("application/json")
			
	    @response = JSON.parse(last_response.body)
	    @response['id'].should eq @example.id.to_s
	    @response['status'].should eq "updated"
	  
      @updated_example = Example.find(BSON::ObjectId(@response['id']))

      @updated_example.id.to_s.should eq @response['id']
      @updated_example.name.should eq "New Example Name"
	    @updated_example.user.should eq @example.user
      @updated_example.description.should eq "Generic Example, tests for issues that may be caused by the testing framework and its componenets"
      @updated_example.project.should eq "SimplePublicTimeline"
      @updated_example.revision.should eq 1
      # @updated_example.email.should eq @example.email
    end
    it "should update record with with a new set of attributes, but @example should not change" do
	    put url,  {:example => {:name => "Implement testing",
	                            :description => "This feature should implement rspec TDD suit for Example resource",
	                            :project => "Example",
	                            :revision => 7 }
	              }
	    last_response.status.should eq 200
	    last_response.content_type.should include("application/json")
	    
	    @response = JSON.parse(last_response.body)
	    @response['status'].should eq "updated"
	    
      @updated_example = Example.first
      @updated_example.id.should eq @example.id
      @updated_example.name.should_not eq @example.name
      @updated_example.user.should eq @example.user
      @updated_example.description.should_not eq @example.description
      @updated_example.project.should_not eq @example.project
      @updated_example.revision.should_not eq @example.revision
      @updated_example.email.should eq @example.email
    end
    it "should update record with with a new set of attributes" do
	    put url,  {:example => {:name => "Implement testing",
	                            :description => "This feature should implement rspec TDD suit for Example resource",
	                            :project => "Example",
	                            :revision => 7 }
	              }
	    last_response.status.should eq 200
	    last_response.content_type.should include("application/json")
	    
	    @response = JSON.parse(last_response.body)
	    @response['status'].should eq "updated"
	    
      @updated_example = Example.first
      @updated_example.id.should eq @example.id
      @updated_example.name.should eq "Implement testing"
      @updated_example.user.should eq @example.user
      @updated_example.description.should eq "This feature should implement rspec TDD suit for Example resource"
      @updated_example.project.should eq "Example"
      @updated_example.revision.should eq 7
      @updated_example.email.should eq @example.email
    end
    it "should update record with with a new partial set of attributes" do
	    put url,  {:example => {:name => "Implement testing",
	                            :description => "This feature should implement rspec TDD suit for Example resource",
	                            :revision => 7 }
	              }
	    last_response.status.should eq 200
	    last_response.content_type.should include("application/json")
  		
	    @response = JSON.parse(last_response.body)
	    @response['status'].should eq "updated"
	    
      @updated_example = Example.first
      @updated_example.id.should eq @example.id
      @updated_example.name.should eq "Implement testing"
      @updated_example.user.should eq @example.user
      @updated_example.description.should eq "This feature should implement rspec TDD suit for Example resource"
      @updated_example.project.should eq "SimplePublicTimeline"
      @updated_example.revision.should eq 7
      @updated_example.email.should eq @example.email

    end
    it "should update record with with a new partial set of attributes and invalid :revision attribute" do
	    put url,  {:example => {:name => "Implement testing",
	                            :description => "This feature should implement rspec TDD suit for Example resource",
	                            :revision => 1 }
	              }
	    last_response.status.should eq 200
	    last_response.content_type.should include("application/json")
  		
	    @response = JSON.parse(last_response.body)
	    @response['status'].should eq "updated"
	    
      @updated_example = Example.first
      @updated_example.id.should eq @example.id
      @updated_example.name.should eq "Implement testing"
      @updated_example.user.should eq @example.user
      @updated_example.description.should eq "This feature should implement rspec TDD suit for Example resource"
      @updated_example.project.should eq "SimplePublicTimeline"
      @updated_example.revision.should eq 1
      @updated_example.email.should eq @example.email
    end
    
    it "should not match passed in email, and return {user}@gmail.ocm" do
      put url, { :example =>  {:email => "ShouldNotPassIn@email.com"} }
      last_response.status.should eq(200) 
      last_response.content_type.should include("application/json")
  		 
      @response = JSON.parse(last_response.body)
      @updated_example = Example.first
      @updated_example.id.should eq @example.id
      @updated_example.name.should eq "Generic Example"
      @updated_example.user.should eq @example.user
      @updated_example.description.should eq "Generic Example, tests for issues that may be caused by the testing framework and its componenets"
      @updated_example.project.should eq "SimplePublicTimeline"
      @updated_example.revision.should eq 1
      @updated_example.email.should eq "#{@example.user}@gmail.com"
    end
    
  end
  
  context "when data is not valid" do
    it "should return error object when name is not present" do
      put url, { :example =>  {:name => ""} }
      last_response.status.should eq(400) 
      last_response.content_type.should include("application/json")
   		
      @response = JSON.parse(last_response.body)
      @response['error'].should eq "record_invalid"
      @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['name'].length.should eq 2
      @response['errors']['name'].should include("can't be blank", "is too short (minimum is 6 characters)")
    end
    it "should return error object when name is too short" do
      @example.name = "a"*3
      put url, { :example =>  {:name => @example.name} }
      last_response.status.should eq(400) 
      last_response.content_type.should include("application/json")
  		 
      @response = JSON.parse(last_response.body)
      @response['error'].should eq "record_invalid"
      @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['name'].length.should eq 1
      @response['errors']['name'].should include("is too short (minimum is 6 characters)")
    end
    it "should return error object when name is too long" do
      @example.name = "a"*250
      put url, { :example =>  {:name => @example.name} }
      last_response.status.should eq(400) 
      last_response.content_type.should include("application/json")
  		 
      @response = JSON.parse(last_response.body)
      @response['error'].should eq "record_invalid"
      @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['name'].length.should eq 1
      @response['errors']['name'].should include("is too long (maximum is 249 characters)")
    end 
    it "should return error object when user is not present" do
      put url, { :example => {:user => ""} }
      last_response.status.should eq(400) 
      last_response.content_type.should include("application/json")
  		 
      @response = JSON.parse(last_response.body)
      @response['error'].should eq "record_invalid"
      @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['user'].length.should eq 1
      @response['errors']['user'].should include("is too short (minimum is 4 characters)")
    end
    it "should return error object when user is not unique" do
      @example.user  = "not_unique"
      FactoryGirl.create(:example, :user => @example.user)
      put url, { :example => {:user => @example.user} }
      last_response.status.should eq(400) 
      last_response.content_type.should include("application/json")
  		 
      @response = JSON.parse(last_response.body)
      @response['error'].should eq "record_invalid"
      @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['user'].length.should eq 1
      @response['errors']['user'].should include("is already taken")
    end
    it "should return error object when user is too short" do
      @example.user = "a"*3
      put url, { :example => {:user => @example.user} }
      last_response.status.should eq(400) 
      last_response.content_type.should include("application/json")
  		 
      @response = JSON.parse(last_response.body)
      @response['error'].should eq "record_invalid"
      @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['user'].length.should eq 1
      @response['errors']['user'].should include("is too short (minimum is 4 characters)")
    end
    it "should return error object when user is too long" do
      @example.user = "a"*21
      put url, { :example => {:user => @example.user} }
      last_response.status.should eq(400) 
      last_response.content_type.should include("application/json")
  		 
      @response = JSON.parse(last_response.body)
      @response['error'].should eq "record_invalid"
      @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['user'].length.should eq 1
      @response['errors']['user'].should include("is too long (maximum is 20 characters)")
    end
    it "should return error object when revision is a integer blow 0" do
      @example.revision = -1
      put url, { :example => {:revision => @example.revision} }
      last_response.status.should eq(400) 
      last_response.content_type.should include("application/json")
  		 
      @response = JSON.parse(last_response.body)
      @response['error'].should eq "record_invalid"
      @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['revision'].length.should eq 1
      @response['errors']['revision'].should include("must be greater than or equal to 0")
    end
    it "should return error object when name and user are missing" do
      put url, { :example =>  {:name => "", :user => ""} }
      last_response.status.should eq(400) 
      last_response.content_type.should include("application/json")
  		 
      @response = JSON.parse(last_response.body)
      @response['error'].should eq "record_invalid"
      @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 2
      @response['errors']['name'].length.should eq 2
      @response['errors']['name'].should include("can't be blank", "is too short (minimum is 6 characters)")
      @response['errors']['user'].length.should eq 1
      @response['errors']['user'].should include("is too short (minimum is 4 characters)")
    end
    it "should return error object with mass-assignment on email with mixed errors " do
      put url, { :example =>  {:email => "ShouldNotPassIn@email.com",  :name => "", :user => ""} }
      last_response.status.should eq(400) 
      last_response.content_type.should include("application/json")
  		 
      @response = JSON.parse(last_response.body)
      @response['error'].should eq "record_invalid"
      @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals with a problem with the passed in parameters. Errors should hint at the problem")
      @response['errors']['name'].should include("can't be blank", "is too short (minimum is 6 characters)")
      @response['errors']['user'].should include("is too short (minimum is 4 characters)")
    end 
  end
  
end