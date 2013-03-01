describe 'GET /api/v1/projects', :type => :api do
	let(:url) { "/api/v1/examples"}

	after(:each) do
		Example.delete_all
	end
	

	context "when data store is empty" do
		it "should return an empty JSON array for resource and :status => 'collected" do 
		  get url
  
		  last_response.status.should eq(200) 
		  last_response.content_type.should include("application/json") 		
      last_response.body.should be_json_eql({'status' => 'collected', "examples" => []}.to_json) 
		end
	end
	context "when data store contains a single data object" do
		it "should return single persisted JSON object" do
			@example = FactoryGirl.create(:example)
			get url	
			
			last_response.status.should eq(200)
  		last_response.content_type.should include("application/json")
      last_response.body.should be_json_eql({:examples => [@example], :status => "collected"}.to_json(:except => [:email, :_id]))
		end
		it "should return single prosisted json object that does not match" do
			@example = FactoryGirl.create(:example)
			get url
			@example.name = "other name"
			
			last_response.status.should eq(200)
  		last_response.content_type.should include("application/json")
      last_response.body.should_not be_json_eql({:examples => [@example], :status => "collected"}.to_json(:except => [:email, :_id]))
		end
	end
	
	context "when calling multiple json data" do
		it "should return multiple prosisted json objects" do
      @examples =  (1..5).collect { |num| FactoryGirl.create(:example, :name => "new name #{num}") }
      get url
      
      last_response.status.should eq(200)
  		last_response.content_type.should include("application/json")
      last_response.body.should be_json_eql({:examples => @examples, :status => "collected"}.to_json(:except => [:email, :_id]))
		end
		it "should return multiple prosisted json objects that do not match" do
      @examples =  (1..5).collect { |num| FactoryGirl.create(:example, :name => "new name #{num}") }
      @examples.each {|example| example.name += "other" }
      get url
      
      last_response.status.should eq(200)
  		last_response.content_type.should include("application/json")
      last_response.body.should_not be_json_eql({:examples => @examples, :status => "collected"}.to_json(:except => [:email, :_id]))
		end	
	end
	
end