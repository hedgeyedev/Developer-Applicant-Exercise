require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  describe 'GET #index' do
    context 'when tweets are successfully fetched' do
      before do
        allow(TweetFetcher).to receive(:fetch).and_return([{ text: 'Sample tweet', user: { screen_name: 'user1' } }])
        get :index
      end

      it 'assigns @tweets' do
        expect(assigns(:tweets)).not_to be_empty
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'when there is an error fetching tweets' do
      before do
        allow(TweetFetcher).to receive(:fetch).and_raise(TweetFetcher::FetchError)
        get :index
      end

      it 'assigns @tweets as empty array' do
        expect(assigns(:tweets)).to eq([])
      end

      it 'sets a flash error message' do
        expect(flash[:error]).to be_present
      end
    end
  end
end
