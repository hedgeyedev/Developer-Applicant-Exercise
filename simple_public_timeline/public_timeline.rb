# -*- coding: utf-8 -*-

require 'pathname'
require 'time'
require 'json'
require 'hashie'
require 'coffee-script'
require 'sass'
require 'compass'
require 'sinatra/base'
require 'redcarpet'
require 'haml'


TOP = Pathname.new(__FILE__).dirname.expand_path
TWENTY_TWEETS_FILE = TOP.join('twitter_cache/twenty_tweets.json')
COMPASS_CONFIG = TOP.join('config/compass.rb')


class PublicTimeline < Sinatra::Base
  configure do
    set :root, TOP
    Compass.add_project_configuration(COMPASS_CONFIG)
  end

  get '/css/:name.css' do
    content_type 'text/css', :charset => 'utf-8'
    sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
  end

  get '/js/index.js' do
    content_type 'text/javascript', :charset => 'utf-8'
    coffee :"coffee/index"
  end


  get '/' do
    tweets = JSON.load(TWENTY_TWEETS_FILE)
    tweets.map! {|tweet| Hashie::Mash.new(tweet)}
    haml :index, :layout => :layout, :locals => {:tweets => tweets}
  end

  get '/via_js' do
    haml :indexjs, :layout => :layout
  end


  get '/tweets.json' do
    content_type :json
    body TWENTY_TWEETS_FILE.read()
  end
end
