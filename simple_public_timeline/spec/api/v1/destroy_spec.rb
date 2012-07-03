describe "DELETE /api/vi/examples/:id", :type => :api do
  let(:url) { "/api/v1/examples/#{@example.id.to_s}"}
  
  before(:each) { @example = FactoryGirl.create(:example) }
  after(:each) { Example.delete_all }
  
  context "if provided with valid id " do
    it "should delete the resource when delete is called on /api/vi/examples/:id" do
      expect {
        delete url
      }.to change(Example, :count).by(-1)
    end
    it "should return the :id and :status of the delete resource" do
      delete url
      last_response.status.should eq(200)
      last_response.content_type.should include("application/json")
  		
  		@response = JSON.parse(last_response.body)
      @response['id'].to_s.should eq @example.id.to_s
      @response['status'].should eq "deleted"
    end
    it "should return a matching JSON response" do
      delete url
      last_response.status.should eq(200)
      last_response.content_type.should include("application/json")

      last_response.body.should be_json_eql({:id => @example.id, :status => "deleted"}.to_json)
    end
  end
  
  context "if provided with a invalid id " do
    it "show throw a record not found error" do
      Example.delete_all
      delete url

      last_response.status.should eq(400)
      last_response.content_type.should include("application/json")
      
      @response = JSON.parse(last_response.body)
	    @response['status'].should eq 'failed'
	    @response['error'].should eq("record_not_found")
      @response['errors'].should eq("Document not found for class Example with id(s) #{example.id.to_s}.")
      @response['code'].should eq(12)
      @response['message'].should include("Record Not Found deals")      
    end
  end
end