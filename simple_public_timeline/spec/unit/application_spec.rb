describe 'App' do
  let(:client) do
    instance_double(Twitter::REST::Client, user_timeline: [])
  end

  before do
    allow(Twitter::REST::Client).to receive(:new).and_return(client)
  end

  describe 'GET /' do
    it 'return a 200' do
      get '/'
      expect(last_response.status).to eq 200
    end

    it 'attempts to create a new twitter client' do
      expect(Twitter::REST::Client).to receive(:new)
      get '/'
    end
  end

  describe 'GET /via-js' do
    it 'return a 200' do
      get '/via-js'
      expect(last_response.status).to eq 200
    end
  end

  describe 'GET /tweets' do
    it 'return a 200' do
      get '/tweets'
      expect(last_response.status).to eq 200
    end

    it 'attempts to create a new twitter client' do
      expect(Twitter::REST::Client).to receive(:new)
      get '/tweets'
    end
  end
end
