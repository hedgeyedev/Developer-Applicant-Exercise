require './application'
require './spec/spec_helper.rb'

set :environment, :test

describe 'get /' do
  it "should respond 200" do
    get '/'
    expect(last_response.status).to eq(200)
  end

  it "should have rendered articles" do
    get '/'
    expect(last_response.body).to include "article-container"
  end
end

describe 'get /via_js' do
  it "should respond 200" do
    get '/via_js'
    expect(last_response.status).to eq(200)
  end

  it "should not have rendered articles" do
    get '/via_js'
    expect(last_response).to_not include "article-container"
  end
end