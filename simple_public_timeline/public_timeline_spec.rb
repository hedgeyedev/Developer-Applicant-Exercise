require_relative 'public_timeline'

describe PublicTimeline do

  it "GET '/' should response 200" do
    get '/'
    last_response.should be_ok
  end
  
end
