#!/usr/bin/ruby

require 'rubygems'
require 'sinatra'
require_relative 'birdhouse'

BIRDHOUSE = BirdHouse.new

  get '/' do
    @tweets = BIRDHOUSE.tweets
    puts "CLASS: #{@tweets.class}"
    puts "INSPECT: #{@tweets.size}"
    erb :index
  end

  get '/via_js' do
  	@tweets = BirdHouse.new.tweets
    erb :update_tweets
  end
