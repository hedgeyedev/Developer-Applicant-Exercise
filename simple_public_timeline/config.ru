require 'rubygems'
require 'bundler'
require 'json'

Bundler.require

require './app.rb'

run Sinatra::Application
