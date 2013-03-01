require "bundler/setup"
Bundler.require(:default)
require  File.join File.dirname(__FILE__), "app"
run App
