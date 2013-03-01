require 'spec_helper'
require 'capybara/rspec'

# describe "Navigation Requests Spec", :type => :request do
#   after(:all) { Admin.delete_all }
#   before(:all) do
#     Admin.delete_all
#     @admin = FactoryGirl.create(:admin) 
#   end
# 
#   describe ".navbar" do
#     it "should contain link Home" do
#       visit '/'   
#       within '.navbar' do
#         page.should have_link('Home')
#       end
#     end
#     it "should contain link Docs" do
#       visit '/'   
#       within '.navbar' do
#         page.should have_link('Docs')
#       end
#     end
#   end
# 
#   describe "Logo" do
#     it 'should link back to root_path and check that only its tab is active' do
#       visit '/docs'
#       within '.navbar' do
#         click_link('SimplePublicTimeline')
#         current_path.should eq '/'
#       end
#       page.has_css?('li.active', :text => 'Home').should be_true
#       page.has_no_css?('li.active', :text => 'Docs').should be_true
#     end
#   end
# 
#   describe "Home a:tag" do
#     it "should redirect to / check that only its tab is active" do
#       visit '/docs'
#       current_path.should eq '/docs'
#       within '.navbar' do
#         click_link('Home')
#       end
#       current_path.should eq '/'
#       page.has_css?('li.active', :text => 'Home').should be_true
#       page.has_no_css?('li.active', :text => 'Docs').should be_true
#     end
#   end
# 
#   describe "Docs a:tag" do
#     it "should redirect to / and set the docs bar as active" do
#       visit '/'
#       current_path.should eq '/'
#       within '.navbar' do
#         click_link('Docs')
#       end
#       current_path.should eq '/docs'
#       page.has_css?('li.active', :text => 'Docs').should be_true
#       page.has_no_css?('li.active', :text => 'Home').should be_true
#     end
#   end
#   describe "Logout Button" do 
#     before(:each) { visit '/'}
#     it "should not be rendered if admin is not logged in" do
#       page.should_not have_link('Logout')
#     end
#     # it "should be rendered if admin is logged in" do
#     #   sign_in :admin, Admin.first
#     #   visit 'social_stocks'
#     #   save_and_open_page
#     #   # admin_signed_in?.should eq true
#     #   within '.navbar' do
#     #     page.should have_link('Logout')
#     #   end
#     # end
#     # it "should log the user out and remove logout button when clicked" do
#     #   visit '/'
#     #   sign_in :admin, @admin
#     #   page.should have_link('Logout')
#     #   # admin_signed_in?.should eq true
#    #    within '.navbar' do
#     #     click_link 'Logout'
#     #   end
#     #     # admin_signed_in?.should eq false
#     #   page.should_not have_link('Logout')
#     # end
# 
#   end
# end