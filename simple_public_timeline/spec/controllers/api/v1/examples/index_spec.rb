# require 'spec_helper'
# 
# describe Api::V1::ExamplesController do
# 
#   describe "GET index" do
#     before { get :index, :format => :json}
#     
#     subject { controller }
# 
#     it { should filter_param(:revision) } # filter is set in config/application.rb
# 
#     # it_behaves_like "a controller type check"
#     # it_behaves_like "a controller render check", :index
#     after(:each) { Example.delete_all }
# 
#     # it "should not equal the same object" do
#     #   @sdf = FactoryGirl.build(:example)
#     #   @other_example = FactoryGirl.build(:example, :name => "some other name")
#     #   @example.should_not eq(@other_example)
#     # end
#     # it "should return matching record from the model" do
#     #   @example = FactoryGirl.create(:example)
#     #   Example.count.should eq(1)
#     #   Example.all.should eq([@example])
#     # end     
#     # it "should return multiple matching record from the model" do
#     #   @examples = (1..5).match FactoryGirl.create(:example, :name => "Simple Example #{num}") }
#     #   Example.count.should eq(5)
#     #   Example.all.should eq(@examples)
#     # end   
#     # it "should return single non-matching recrod from model" do
#     #   @example = FactoryGirl.create(:example)
#     #   Example.count.should eq(1)
#     #   Example.all.should eq([@example])
#     # end     
#   end
# 
# end