require "test_helper"

class RecentPublicTweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recent_public_tweets_index_url
    assert_response :success
  end
end
