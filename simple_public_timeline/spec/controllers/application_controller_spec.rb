#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

require "spec_helper"

describe ApplicationController do
  subject { ApplicationController.new }

  describe "#default_locale" do
    it "returns the default locale" do
      expect(subject.default_locale).to eq("en")
    end
  end

  describe "#setup" do
    it "should setup the current locale as default locale" do
      allow(subject).to receive(:params).and_return({})
      subject.send(:setup)

      expect(subject.current_locale).to eq("en")
    end

    it "should setup the current locale as the given locale" do
      allow(subject).to receive(:params).and_return({locale: "it"})
      subject.send(:setup)

      expect(subject.current_locale).to eq("it")
    end
  end

  describe "#handle_error" do
    it "should setup variables for a general error" do
      error = RuntimeError.new
      allow(subject).to receive(:render)
      subject.send(:handle_error, error)

      expect(subject.instance_variable_get(:@error)).to eq(error)
      expect(subject.instance_variable_get(:@error_title)).to eq("Error - RuntimeError")
      expect(subject.instance_variable_get(:@error_code)).to eq(500)
    end

    it "should setup variables for a debug dump" do
      error = Lazier::Exceptions::Debug.new
      allow(subject).to receive(:render)
      subject.send(:handle_error, error)
      
      expect(subject.instance_variable_get(:@error)).to eq(error)
      expect(subject.instance_variable_get(:@error_title)).to eq("Debug")
      expect(subject.instance_variable_get(:@error_code)).to eq(503)
    end

    it "should render the error" do
      expect(subject).to receive(:render).with(nil, status: 500, layout: "error", formats: [:html])

      subject.send(:handle_error, RuntimeError.new)
    end
  end
end