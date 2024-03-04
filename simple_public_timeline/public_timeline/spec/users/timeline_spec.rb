require 'rails_helper' 

RSpec.describe 'Twitter Timeline Page', type: :feature do 
  before :each do
    VCR.use_cassette('user_posts_batch') do
      visit root_path
    end
  end

  describe 'page attributes' do
    it 'displays the correct heading' do
      expect(page).to have_content("Twitter")
      expect(page).to have_content("Recent Public Tweets")
    end

    it 'displays user tweets' do
      within('.tweets-container') do
        expect(page).to have_css('.tweet', minimum: 1)
        
        expect(page).to have_css('.profile-image')
        expect(page).to have_css('.content')
        expect(page).to have_css('.content strong') # For the username
        expect(page).to have_css('.content p') # For the tweet text
        expect(page).to have_css('.content small') # For the tweet creation and source
      end
    end

    it 'has login and join links' do
      expect(page).to have_link('Login', href: login_path)
      expect(page).to have_link('Join Twitter', href: register_user_path)
    end

    it 'has a language selection dropdown' do
      expect(page).to have_select('language', with_options: ['English', 'Español', 'Français', 'Mandarin'])
    end

    it 'has the correct page structure' do  
      expect(page).to have_css('.tweets-container')
      expect(page).to have_css('.sidebar')
    end
  end
end