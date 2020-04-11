require 'rubygems'
require 'bundler'
require 'sinatra'
require 'haml'
require 'sass/plugin/rack'
require 'dotenv'
require 'twitter'
require 'action_view'
require 'action_view/helpers'
require 'rack/test'
require 'rspec'

require File.expand_path '../../app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }
