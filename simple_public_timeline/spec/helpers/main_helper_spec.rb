#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

require "spec_helper"

describe MainHelper do
  class MainHelperSpec
    include MainHelper

    def link_to(*args)
      args.join("@")
    end
  end

  subject { MainHelperSpec.new }

  before(:each) do
    @tweet = OpenStruct.new({
      text: "-1--2-34---5",
      hashtags: [
        OpenStruct.new(indices: [1, 2], text: "33"),
        OpenStruct.new(indices: [4, 5], text: "66")
      ],
      media: [OpenStruct.new(indices: [7, 8], url: "99")],
      urls: [OpenStruct.new(indices: [10, 12], url: "1212")],
      user_mentions: [OpenStruct.new(indices: [6, 7], screen_name: "SCREEN", name: "NAME")]
    })
  end

  describe "#parse_entities" do
    it "should return a list of entities for a tweet" do
      expect(subject.parse_entities(@tweet)).to eq([
        [1, 2, "#33@https://twitter.com/search?q=%2333@{:target=>:blank}"], 
        [4, 5, "#66@https://twitter.com/search?q=%2366@{:target=>:blank}"], 
        [6, 7, "@SCREEN@https://twitter.com/SCREEN@{:target=>:blank, :rel=>:tooltip, :title=>\"NAME\"}"], 
        [7, 8, "99@99@{:target=>:blank}"], [10, 12, "1212@1212@{:target=>:blank}"]
      ])
    end 
  end

  describe "#text_with_active_entities" do
    it "should replace the text for the tweet" do
      expect(text_with_active_entities(@tweet)).to eq("
        -
        <a href=\"https://twitter.com/search?q=%2333\" target=\"blank\">#33</a>--
        <a href=\"https://twitter.com/search?q=%2366\" target=\"blank\">#66</a>
        -<a href=\"https://twitter.com/SCREEN\" rel=\"tooltip\" target=\"blank\" title=\"NAME\">@SCREEN</a>
        <a href=\"99\" target=\"blank\">99</a>
        --<a href=\"1212\" target=\"blank\">1212</a>
      ".gsub(/\n\s+/, "").strip)
    end
  end
end