require 'spec_helper'

describe TweetsController do
  describe :via_js do
    before(:each) { get :via_js }
    
    it { should render_template(:via_js)  }
    it { should render_with_layout }
    it { should respond_with(:success) }
	end
end