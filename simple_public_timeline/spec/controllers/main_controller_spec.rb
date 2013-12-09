#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

require "spec_helper"

describe MainController do
  describe "GET index" do
    before(:each) do
      allow_any_instance_of(Twitter::Streaming::Client).to receive(:sample){ |args, &block|
        100.times.each {|i| block.call(Twitter::Tweet.new(id: 1)) }
      }
    end

    it "should set a client" do
      get :index
      expect(controller.instance_variable_get(:@client)).to be_a(Twitter::Streaming::Client)
    end

    it "should return a list of tweets" do
      get :index

      tweets = controller.instance_variable_get(:@tweets)
      expect(tweets).to be_a(Array)
      expect(tweets.map {|t| t.class}.uniq.first.to_s).to eq("Twitter::Tweet")
    end
  end
end
