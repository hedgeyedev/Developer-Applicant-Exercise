# require 'spec_helper'
# 
# describe Api::V1::ExamplesController do
# 
#   describe "POST create" do 
#     after(:each) { Example.delete_all }
#     subject { controller }
# 
#     # context "default controller behavior" do
#       # before(:each) { post :create, :format => :json }
#       # it_behaves_like "a controller type check"
#       # it_behaves_like "a controller render check", :create
#     # end
#     context "when data is not valid" do
#       it "should catch ActiveRecord::RecordInvalid for name empty" do
#         params = FactoryGirl.build(:example).attributes.except('email')
#         a = post :create, :example => params, :format => :json
#         assigns[:example].should_not be_nil
#       end
#       it "should catch exception MultiparameterAssignmentErrors for multiple assignment errors" do
#         @example = Example.new
#         lambda { 
#           post :create, @example
#         }.should raise_error(ActiveRecord::RecordInvalid)
#       end
#       it "should catch ActiveModel::MassAssignmentSecurity when assigning email" do
#         @example = FactoryGirl.build(:example)
#         lambda { 
#           post :create, @example
#         }.should raise_error(ActiveRecord::AdapterNotFound )
#       end
#     end
#     
#     describe "error handeling" do
#       it "should raise error ActiveRecord::RecordInvalid empty resource :examples" do
#         @example = Example.new
#          lambda {
#           post :create, :example => @example
#         }.should raise_error(ActiveRecord::RecordInvalid)
#       end
#     end
#   end
# 
# end





# 
# context "when user parameters are valid" do
#   let(:params) { FactoryGirl.build(:example).attributes.except('id', 'email') }
#   before(:each) do 
#     post :create,  :example => params, :format => :json
#   end
# 
#   it "should match the example instance variable" do 
#     assigns[:example].name.should eq(params['name'])
#     assigns[:example].description.should eq(params['description'])
#     assigns[:example].user.should eq(params['user'])
#     assigns[:example].project.should eq(params['project'])
#     assigns[:example].revision.should eq(params['revision'])
#     assigns[:example].email.should eq("GenericEmail@gmail.com")
#   end
# end
# 
# context "when user parameters are invalid" do
#   let(:params) { FactoryGirl.build(:example).attributes.except('id') }
#   before(:each) do 
#     post :create, :example => params, :format => :json
#   end       
#   
#   it "should return errors object when mass assignment attempted" do
#     errors = %({"error":"mass_assignment", "code":10, "message":"Can't mass-assign protected attributes: email"})
# 
#     response.content_type.should eq("application/json")
#     response.status.should eq(422)
#     response.body.should be_json_eql(errors)
#     response.body.should have_json_type(Integer).at_path('code')
#   end
# end