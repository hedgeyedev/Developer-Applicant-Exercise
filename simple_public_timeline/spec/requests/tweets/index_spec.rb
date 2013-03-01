describe TweetsController do
  include TweetsHelper

  describe "Index" do
    url = "http://localhost:3000/testdata/public_timeline.json"
    before(:each) do
      TwitterTimeline.stub(:pull_data).and_return(TwitterTimeline.pull_data_from_url(url))
      visit '/'
    end
    it "should 20 tweets" do
      page.has_css?("div#tweets div.well", :count => 20)
    end
    
    describe "Tweets[0]" do 
      before(:all) do
        @tweets = nil
        TwitterTimeline.stub(:pull_data).and_return(@tweets = TwitterTimeline.pull_data_from_url(url))
        visit '/'
        @first_tweet_xpath = page.find("#tweets div[1]")
      end
      
      it "should have image to with correct url" do 
        profile_image_url = "http://a0.twimg.com/profile_images/2304149411/LA2bTH5E_normal"
        within(@first_tweet_xpath) do
          page.should have_xpath ".//img[@src=\'" + profile_image_url +"']"
        end
      end
      it "should have image with hyperlink to user's page" do
        user_account_url = "https://twitter.com/HotPocketsNigga"
        within(@first_tweet_xpath) do
          page.should have_xpath ".//a[@href=\'" + user_account_url + "']"
        end
      end
      it "should have correct user name" do
        name = "DeAndre Flowers"
        user_account_url = "https://twitter.com/HotPocketsNigga"
        within(@first_tweet_xpath) do
          page.find(:xpath, ".//h3/a[@href=\'" + user_account_url + "']").should have_content(name)
        end
      end
      it "should have hyperlink on name to user's profile" do
        user_account_url = "https://twitter.com/HotPocketsNigga"
        within(@first_tweet_xpath) do
          page.should have_xpath ".//h3/a[@href=\'" + user_account_url + "']"
        end
      end
      it "should have correct message" do
        within(@first_tweet_xpath) do
          page.should have_content "Just had a roasting session with mu dog, he got on my helmet -__-"
        end
      end
      it "should provide have correct time difference" do
        extend ActionView::Helpers::TextHelper
        
        within(@first_tweet_xpath) do
          time = time_from_creation @tweets[0]['created_at']
          page.should have_content "Less than #{time} ago"
        end
      end  
      it "should have a hyperlink to users timeline on time difference" do
        extend ActionView::Helpers::TextHelper
        user_timeline_account_url = "https://twitter.com/HotPocketsNigga/status/220564122494976000"
        within(@first_tweet_xpath) do
          time = time_from_creation @tweets[0]['created_at']
          time_difference = "Less than #{time} ago"
          page.find(:xpath, ".//a[@href=\'" + user_timeline_account_url + "']").should have_content(time_difference)
        end
      end
      it "should have correct source" do
        within(@first_tweet_xpath) do
          page.should have_content "Twitter for Android"
        end        
      end
      it "should have correct source URL" do
        content = "Twitter for Android"
        content_url = "http://twitter.com/download/android"
        within(@first_tweet_xpath) do
          page.find(:xpath, ".//a[@href=\'" + content_url + "']").should have_content(content)          
        end
      end
    end
  end
end