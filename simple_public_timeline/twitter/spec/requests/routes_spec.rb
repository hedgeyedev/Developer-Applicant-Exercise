require 'rails_helper'

# routing tests
RSpec.describe "Routing", type: :request do
  describe "GET /" do
    it "routes to the root path to display tweets through Rails" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /via_js" do
    it "routes to the via_js_path to display tweets through JavaScript" do
      get via_js_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /bonus" do
    it "routes to the bonus_path" do
      get bonus_path
      expect(response).to have_http_status(200)
    end
  end

end
