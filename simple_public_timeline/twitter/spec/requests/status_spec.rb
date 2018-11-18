require 'rails_helper'

RSpec.describe "Status requests", type: :request do

  describe "get /tweetsapi" do
    it "returns a status message" do
      get ('/tweetsapi')
      json = JSON.parse(response.body)
      expect(json['status']).to eql('SUCCESS')
      expect(response.status).to eql(200)
    end
  end

end



