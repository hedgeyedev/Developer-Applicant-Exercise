require 'rails_helper'

RSpec.describe TimelineHelper, type: :helper do

  describe 'get_link_text' do
    let(:source) {
      "<a href=\"http://twitter.com/\" rel=\"nofollow\"><a href=\"http://twitter.com/\" rel=\"nofollow\">Twitter for iPhone</a></a>"
    }
    let(:result_text) { "Twitter for iPhone" }
    it 'should get the inner text from the source html text' do
      expect(helper.get_link_text(source)).to eq result_text
    end
  end
end
