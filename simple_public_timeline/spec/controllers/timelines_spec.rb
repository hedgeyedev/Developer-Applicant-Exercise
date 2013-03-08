require 'spec_helper'

describe TimelinesController do 
  include TimelinesHelper 
  it "should render template index" do
  	get 'index'
  	TimelinesHelper.stub!(:get_tweets)
  	response.should render_template('index')
  end

  it "should render template js" do
  	get 'js'
  	response.should render_template('js')
  end
end