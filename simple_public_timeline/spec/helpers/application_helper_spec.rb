#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

require "spec_helper"

describe ApplicationHelper do
  class ApplicationHelperSpec
    include ApplicationHelper

    def request
      OpenStruct.new(user_agent: "")
    end
  end

  subject { ApplicationHelperSpec.new }

  describe "#browser" do
    it "should be a Brauser::Browser object" do
      expect(subject.browser).to be_a(Brauser::Browser)
    end    
  end

  describe "#browser_supported?" do
    it "should delegate to the browser" do
      expect(subject.browser).to receive(:supported?).with((Rails.root + "config/supported-browsers.yml").to_s).and_return("YES")
      expect(subject.browser_supported?).to eq("YES")
    end   
  end
end