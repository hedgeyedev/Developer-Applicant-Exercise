require_relative "spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  it "responds with a welcome message" do
    get "/"
    expect(last_response.status).to eq(200)
  end
end
