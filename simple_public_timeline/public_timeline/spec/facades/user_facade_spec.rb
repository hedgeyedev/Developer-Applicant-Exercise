require 'rails_helper'

RSpec.describe 'UserFacade' do 
  it 'should call the facade and return search results' do
    VCR.use_cassette('user_posts_batch') do
      results = UserFacade.new.user_posts

      expect(results).to be_an(Array)
      expect(results.length).to eq(20)

      first_post = results.first
      expect(first_post).to be_a(Post)
      expect(first_post.profile_image).to be_a(String)
      expect(first_post.profile_link).to be_nil.or be_a(String)
      expect(first_post.reply).to be_nil.or be_a(String)
      expect(first_post.source).to be_a(String)
      expect(first_post.text).to be_a(String)
      expect(first_post.tweet_creation).to be_a(String)
      expect(first_post.username).to be_a(String)
    end
  end
end