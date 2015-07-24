require File.join(File.dirname(__FILE__), 'spec_helper.rb')

describe Server do
  include TwitterFactory

  def app
    Server
  end

  # mock sample tweets
  let(:sample_tweets) do
    Array.new(20) { build_tweet }
  end

  # stub tweet retrieval to avoid API hits
  before do
    allow_any_instance_of(Server).to receive(:top_20_tweets).and_return(sample_tweets)
  end

  # confirm that index page renders all tweets in layout
  describe 'GET /' do
    it 'is successful' do
      get '/'
      expect(last_response).to be_ok
    end

    it 'looks up tweets' do
      expect_any_instance_of(Server).to receive(:top_20_tweets).once
      get '/'
    end

    it 'does not render tweet script' do
      get '/'
      expect(last_response.body).not_to have_tag(
        'body .tweets .tweet-list script'
      )
    end

    it 'renders tweets in body' do
      get '/'
      expect(last_response.body).to have_tag(
        'body .tweets .tweet-list .tweet', count: 20
      )
    end
  end

  # confirm that via_js page renders javascript to fetch tweets
  describe 'GET /via_js' do
    it 'is successful' do
      get '/via_js'
      expect(last_response).to be_ok
    end

    it 'does not look up tweets' do
      expect_any_instance_of(Server).not_to receive(:top_20_tweets)
      get '/via_js'
    end

    it 'renders tweet script' do
      get '/via_js'
      expect(last_response.body).to have_tag(
        'body .tweets .tweet-list script', count: 1
      )
    end

    it 'does not render tweets' do
      get '/via_js'
      expect(last_response.body).not_to have_tag('.tweet')
    end
  end

  # confirm that tweet list renders all tweets in raw form
  describe 'GET /tweets' do
    it 'is successful' do
      get '/tweets'
      expect(last_response).to be_ok
    end

    it 'looks up tweets' do
      expect_any_instance_of(Server).to receive(:top_20_tweets).once
      get '/tweets'
    end

    it 'does not render tweet container' do
      get '/tweets'
      expect(last_response.body).not_to have_tag('.tweets')
    end

    it 'renders raw tweets' do
      get '/tweets'
      expect(last_response.body).to have_tag(
        '.tweet', count: 20
      )
    end
  end

  # confirm that style sheet is rendered
  describe 'GET /application.css' do
    it 'is ok' do
      get '/application.css'
      expect(last_response).to be_ok
    end

    it 'returns style sheet' do
      get '/application.css'
      expect(last_response.content_type).to start_with('text/css')
    end
  end

  # confirm tweets are fetched from API correctly
  describe '#top_20_tweets' do
    subject { app.new! }

    let(:client) { double(search: search) }
    let(:search) { double(take: :tweet_array) }

    before do
      allow(subject).to receive(:top_20_tweets).and_call_original
      allow(subject).to receive(:twitter_client).and_return(client)
    end

    it 'searches hedgeye' do
      expect(client).to receive(:search).once.with('to:hedgeye')
      subject.top_20_tweets
    end

    it 'takes 20 tweets' do
      expect(search).to receive(:take).once.with(20)
      subject.top_20_tweets
    end

    it 'returns tweets' do
      expect(subject.top_20_tweets).to be(:tweet_array)
    end
  end

  # confirm that Twitter API is initialized
  describe '#twitter_client' do
    it 'returns new client' do
      expect(app.new!.twitter_client).to be_a(Twitter::REST::Client)
    end
  end
end
