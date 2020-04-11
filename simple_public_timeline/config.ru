require 'rubygems'
require 'bundler'
require 'sinatra'
require 'haml'
require 'sass/plugin/rack'
require 'dotenv'
require 'twitter'
require 'action_view'
require 'action_view/helpers'

# Load env vars
Dotenv.load

# Configure Sass processor
Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

Bundler.require

# Run app
require './app'
run Sinatra::Application
