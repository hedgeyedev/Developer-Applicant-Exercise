require 'spec_helper'

describe 'Public timeline' do
  it 'displays recent tweets' do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Recent Public Tweets')
  end
end
