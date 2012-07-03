describe 'POST /api/v1/projects', :type => :api do
	let(:url) { "/api/v1/examples"}

  before(:each) { @example = FactoryGirl.build(:example) }
  after(:each) { Example.delete_all }
  after(:all) { Example.delete_all }

	context "when data valid" do

    it "should check the validity of the created resource" do
      post url , { :example =>  @example.attributes.black_list('id', 'email') }
      
      last_response.status.should eq(200)
      last_response.content_type.should include("application/json")
  		@response = JSON.parse(last_response.body)
      @response['id'].class.should eq String
      @response['status'].should eq "created"
      
      @example = Example.find(@response['id'])
      @example.id.to_s.should eq @response['id']
	    @example.name.should eq "Generic Example"
	    @example.user.should eq "user1"
      @example.description.should eq "Generic Example, tests for issues that may be caused by the testing framework and its componenets"
      @example.project.should eq "SimplePublicTimeline"
      @example.revision.should eq 1
      @example.email.should eq "#{@example.user}@gmail.com"

    end
    
		
		it "should check the response body with a JSON representation of :example resource" do
      post url , { :example =>  @example.attributes.black_list('id', 'email') }
			last_response.status.should eq(200)
			last_response.content_type.should include("application/json")
      
			@response = JSON.parse(last_response.body)
			([last_response.body] - [{:id => @response['id'], :status => 'created'}.to_json]).should be_empty
		end
		
	end
	context "when passed in parameters are not valid" do
	  it "should throw silent exception (log) for mass-assignment and check that email is equal to user@gmail.com" do

	    post url, { :example =>  @example.attributes.black_list('id') }
	    
			last_response.status.should eq(200)	
			last_response.content_type.should include("application/json")
			@example.email = "#{@example.user}@gmail.com"
		end
	  
	  it "should check the validity of the resource with invalid :revision attribute" do
      @example.revision = "cat"
      post url , { :example =>  @example.attributes.black_list('id', 'email') }

      last_response.status.should eq(400)
      last_response.content_type.should include("application/json")
  		@response = JSON.parse(last_response.body)
      @response['status'].should eq "failed"
      @response['errors']['revision'].should include("is not a number")
    end		
    
		it "should return error object when name is not present" do
		  post url , { :example =>  @example.attributes.black_list('id', 'email', 'name') }
      
			last_response.status.should eq(400)	
			last_response.content_type.should include("application/json")
			
			@response = JSON.parse(last_response.body)
			@response['status'].should eq "failed"
			@response['error'].should eq "record_invalid"
		  @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['name'].length.should eq 2
      @response['errors']['name'].should include("can't be blank", "is too short (minimum is 6 characters)")
		end
		it "should return error object when name is too short" do
			@example.name = "a"*3
      post url, { :example =>  @example.attributes.black_list('id', 'email') }
			last_response.status.should eq(400)	
			last_response.content_type.should include("application/json")
			
			@response = JSON.parse(last_response.body)
			@response['status'].should eq "failed"
			@response['error'].should eq "record_invalid"
		  @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['name'].length.should eq 1
      @response['errors']['name'].should include("is too short (minimum is 6 characters)")
		end
		it "should return error object when name is too long" do
			@example.name = "a"*250
		
      post url, { :example =>  @example.attributes.black_list('id', 'email') }
			last_response.status.should eq(400)	
			last_response.content_type.should include("application/json")
			
			@response = JSON.parse(last_response.body)
			@response['status'].should eq "failed"
			@response['error'].should eq "record_invalid"
		  @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['name'].length.should eq 1
      @response['errors']['name'].should include("is too long (maximum is 249 characters)")
		end
		
		it "should return error object when user is not present" do
      post url, { :example =>  @example.attributes.black_list('id', 'email', 'user') }
			last_response.status.should eq(400)	
			last_response.content_type.should include("application/json")
			
			@response = JSON.parse(last_response.body)
			@response['status'].should eq "failed"
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
      post url, { :example =>  @example.attributes.black_list('id', 'email') }
			last_response.status.should eq(400)	
			last_response.content_type.should include("application/json")
			
			@response = JSON.parse(last_response.body)
			@response['status'].should eq "failed"
			@response['error'].should eq "record_invalid"
		  @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['user'].length.should eq 1
      @response['errors']['user'].should include("is already taken")
		end
		it "should return error object when user is too short" do
		  @example.user = "a"*3
      post url, { :example =>  @example.attributes.black_list('id', 'email') }
			last_response.status.should eq(400)	
			last_response.content_type.should include("application/json")
			
			@response = JSON.parse(last_response.body)
			@response['status'].should eq "failed"
			@response['error'].should eq "record_invalid"
		  @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['user'].length.should eq 1
      @response['errors']['user'].should include("is too short (minimum is 4 characters)")
		end
		it "should return error object when user is too long" do
		  @example.user = "a"*21
      post url, { :example =>  @example.attributes.black_list('id', 'email') }
			last_response.status.should eq(400)	
			last_response.content_type.should include("application/json")
			
			@response = JSON.parse(last_response.body)
			@response['status'].should eq "failed"		
			@response['error'].should eq "record_invalid"
		  @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['user'].length.should eq 1
      @response['errors']['user'].should include("is too long (maximum is 20 characters)")
		end
		it "should return error object when revision is a integer blow 0" do
		  @example.revision = -1
      post url, { :example =>  @example.attributes.black_list('id', 'email') }
			last_response.status.should eq(400)	
			last_response.content_type.should include("application/json")
			
			@response = JSON.parse(last_response.body)
			@response['status'].should eq "failed"
			@response['error'].should eq "record_invalid"
		  @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals")
      @response['errors'].length.should eq 1
      @response['errors']['revision'].length.should eq 1
      @response['errors']['revision'].should include("must be greater than or equal to 0")
		end
		
		it "should return error object when name and user are missing" do
      post url, { :example =>  @example.attributes.black_list('id', 'email', 'name', 'user') }
			last_response.status.should eq(400)	
			last_response.content_type.should include("application/json")
			
			@response = JSON.parse(last_response.body)
			@response['status'].should eq "failed"
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
      post url, { :example =>  @example.attributes.black_list('id', 'name', 'user') }
			last_response.status.should eq(400)	
			last_response.content_type.should include("application/json")
			
			@response = JSON.parse(last_response.body)
			@response['status'].should eq "failed"
			@response['error'].should eq "record_invalid"
		  @response['code'].should eq 11
      @response['message'].should include("Record Invalid deals with a problem with the passed in parameters. Errors should hint at the problem")
      @response['errors']['name'].should include("can't be blank", "is too short (minimum is 6 characters)")
      @response['errors']['user'].should include("is too short (minimum is 4 characters)")
    end
	end
	
end