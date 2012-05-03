ENV["RACK_ENV"] = "test"

require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |conf|
  conf.include Rack::Test::Methods

  def app
    PublicTimeline.new
  end
end
