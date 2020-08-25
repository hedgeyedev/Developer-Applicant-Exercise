require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'home' do
    it 'gets home' do
      get root_url
      expect(response).to have_http_status(200)
      expect(response).to render_template('home')
    end
  end

  describe 'home_js' do
    it 'gets home_js (/via_js)' do
      get via_js_url
      expect(response).to have_http_status(200)
      expect(response).to render_template('home_js')
    end
  end
end
