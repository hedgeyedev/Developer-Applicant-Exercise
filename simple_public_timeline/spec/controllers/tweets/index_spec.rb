require 'spec_helper'

describe TweetsController do
  describe :index do
    before(:each) { get :index }
    
    it { should render_template(:index)  }
    it { should render_with_layout }
    it { should respond_with(:success) }

	end
end