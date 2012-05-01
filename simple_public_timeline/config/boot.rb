ENV["RACK_ENV"] ||= "development"

require 'rubygems'
require 'bundler'
Bundler.require

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

require "./lib/public_timeline"
