$:.unshift File.dirname(__FILE__), File.expand_path('app', __FILE__)
require 'bundler'
Bundler.setup(:default)
require 'sinatra'
require 'app'

run Sinatra::Application