# coding: utf-8
require 'sinatra'
require 'sinatra/cors'
require 'optparse'
require 'json'
require 'securerandom'
require 'time'
require 'literate_randomizer'

set :allow_origin, "http://127.0.0.1:4537" # This should match the client-side application's origin.
set :allow_methods, "GET"
set :allow_headers, "content-type"

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby main.rb [options]"

  opts.on("--cors PORT", "Enable CORS for the specified port") do |port|
    options[:cors] = port
  end

  opts.on("-p", "--port PORT", "Listen on the specified port") do |port|
    options[:port] = port
  end

end.parse!(ARGV) # use parse! to remove the parsed options from ARGV

if options[:port]
  set :port, options[:port]
end

# if options[:cors]
#   set :allow_origin, "http://localhost:4537"
#   set :allow_methods, "GET,POST"
#   set :allow_headers, "content-type"
# end

class Tweet
  SOURCES = [
    '<a href="http://twitter.com/" rel="nofollow">Twitter for iPhone</a>',
    '<a href="http://twitter.com/" rel="nofollow">Twitter for Android</a>',
    '<a href="http://twitter.com/" rel="nofollow">Twitter Web Client</a>',
    '<a href="http://www.hootsuite.com" rel="nofollow">HootSuite</a>'
  ]

  # @return [String] url of a random picsm 50x50 photo
  def picsum_photo
    "https://picsum.photos/id/#{Random.new.rand(1..200)}/50/50"
  end

AUTHORS = [
  "Alejandro Escamilla",
  "Paul Jarvis",
  "Aleks Dorohovich",
  "Vadim Sherbakov",
  "Yoni Kaplan-Nadel",
  "Jerry Adney",
  "Go Wild",
  "Matthew Wiebe",
  "Ryan McGuire",
  "Samantha Sophia",
  "Nina Strehl",
  "Luis Llerena",
  "Jay Mantri",
  "Jeff Sheldon",
  "Roman Logov",
  "Joshua Earle",
  "Dustin Lee",
  "Kaique Rocha",
  "Joanna Kosinska",
  "Scott Webb",
  "Cayton Heath",
  "Oscar Nilsson",
  "Patrick Hendry",
  "Todd Quackenbush",
  "Rodion Kutsaev",
  "Ales Krivec",
  "Sarah Dorweiler",
  "Sergey Zolkin",
  "Hieu Le",
  "Jakub Kapusnak",
  "Aaron Burden",
  "Evan Kirby",
  "Brooke Cagle",
  "Alexandru Tudorache",
  "Ben White",
  "Lauren Mancke",
  "Willian Justen de Vasconcellos",
  "Breno Machado",
  "Chris Barbalis",
  "Jonas Nilsson Lee",
  "Jason Blackeye",
  "Adam Kool",
  "Kaleb Nimz",
  "Timothy Paul Smith",
  "Freddie Marriage",
  "Mark Solarski",
  "Stefan Stefancik",
  "NASA",
  "Eutah Mizushima",
  "Sharon Pittaway",
  "Alessio Lin",
  "Igor Ovsyannykov",
  "Frank McKenna",
  "Redd Angelo",
  "Andrew Neel",
  "Dmitry Ratushny",
  "Marcelo Quinan",
  "Brooke Lark",
  "Annie Spratt",
  "Jordan Sanchez",
  "Joseph Gonzalez",
  "Jaz King",
  "Philipp Reiner",
  "Andrew Ridley",
  "Vidar Nordli-Mathisen",
  "Morgan Sessions",
  "Joshua Ness",
  "Peter Hershey",
  "Mira Bozhko",
  "Joel Filipe",
  "Nick Karvounis",
  "Clem Onojeghuo",
  "John Towner",
  "Clem Onojeguo",
  "Martin Kníže",
  "Ian Baldwin",
  "Crew",
  "Pineapple Supply Co.",
  "Dave Meier",
  "Andre Hunter",
  "Paul Green",
  "Puk Khantho",
  "Ryan Holloway",
  "Kari Shea",
  "Amir Kuckovic",
  "Blake Richard Verdoorn",
  "Jens Kreuter",
  "Alexander Mils",
  "Glen Carrie",
  "Cristina Gottardi",
  "Devin Avery",
  "Michael Heuser",
  "Daniel von Appen",
  "Kelsey Knight",
  "Mikael Cho",
  "Jp Valery",
  "James Connolly",
  "Matthew Henry",
  "Julian O'hayon",
  "Dmitri Popov",
  "Danielle MacInnes",
  "Cassie Matias",
  "Rula Sibai",
  "James Douglas",
  "Ioana Cristiana",
  "Alistair MacRobert",
  "Clem Onojeghuo",
  "Dan Gold",
  "Jon Tyson",
  "Chris Brignola",
  "César Couto",
  "Zach Betten",
  "Tom Pumford",
  "Jared Rice",
  "Kara Michelle",
  "Quino Al",
  "Simon Rae",
  "Nathan Anderson",
  "Benjamin Combs",
  "Benjamin Voros",
  "Lucia Macedo",
  "Greg Becker",
  "Riccardo Chiarini",
  "Vita Vilcina",
  "Nathaniel Tetteh",
  "Giu Vicente",
  "Vishwas Katti",
  "Eduardo Dutra",
  "Sylwia Bartyzel",
  "Logan Fisher",
  "Greg Ortega",
  "Lachlan Gowen",
  "Tina Rataj",
  "Camille Minouflet",
  "Maxime Lebrun",
  "Daniel Frank",
  "Elizeu Dias",
  "Warren Wong",
  "Luke Chesser",
  "David Marioni",
  "Cristian Newman",
  "Tina Rataj-Berard"
]

  def initialize
    screen_name = AUTHORS.sample.gsub(' ', '_').downcase
    time = (Time.now- Random.new.rand(20..100)).strftime("%a %b %d %H:%M:%S +0000 %Y")
    author_index = rand AUTHORS.size
    in_reply_to_screen_name = author_index.even? ? AUTHORS[author_index].gsub(' ', '_').downcase : nil
    @tweet_data = {
      "text" => LiterateRandomizer.sentence,
      "truncated" => [true, false].sample,
      "in_reply_to_user_id" => nil,
      "in_reply_to_status_id" => nil,
      "favorited" => false,
      "source" => "<a href=\"http://twitter.com/\" rel=\"nofollow\">#{SOURCES.sample}</a>",
      "in_reply_to_screen_name" => in_reply_to_screen_name,
      "in_reply_to_status_id_str" => nil,
      "id_str" => SecureRandom.hex(10),
      "entities" => {
        "user_mentions" => [],
        "urls" => [],
        "hashtags" => []
      },
      "contributors" => nil,
      "retweeted" => false,
      "in_reply_to_user_id_str" => nil,
      "place" => nil,
      "retweet_count" => rand(1..10),
      "created_at" => time,
      "retweeted_status" => nil,
      "user" => {
        "notifications" => nil,
        "profile_use_background_image" => true,
        "statuses_count" => rand(10..300),
        "profile_background_color" => "C0DEED",
        "followers_count" => rand(1..1000),
        "profile_image_url" => picsum_photo,
        "listed_count" => rand(0..10),
        "profile_background_image_url" => "http://example.com/bg_image.jpg",
        "description" => "Sample description",
        "screen_name" => screen_name,
        "default_profile" => true,
        "verified" => false,
        "time_zone" => "UTC",
        "profile_text_color" => "333333",
        "is_translator" => false,
        "profile_sidebar_fill_color" => "DDEEF6",
        "location" => "Sample location",
        "id_str" => SecureRandom.hex(8),
        "default_profile_image" => false,
        "profile_background_tile" => false,
        "lang" => "en",
        "friends_count" => rand(1..200),
        "protected" => false,
        "favourites_count" => rand(0..20),
        "created_at" => time,
        "profile_link_color" => "0084B4",
        "name" => "Sample User",
        "show_all_inline_media" => false,
        "follow_request_sent" => nil,
        "geo_enabled" => false,
        "profile_sidebar_border_color" => "C0DEED",
        "url" => "http://twitter.com/#{screen_name}",
        "id" => SecureRandom.random_number(100000),
        "contributors_enabled" => false,
        "following" => nil,
        "utc_offset" => rand(-12..12) * 3600
      },
      "id" => SecureRandom.random_number(100000),
      "coordinates" => nil,
      "geo" => nil
    }
  end

  def to_json(*_args)
    @tweet_data.to_json
  end
end

def get_tweets(number)
  tweets_array = (1..number).map { Tweet.new }
  tweets_array.to_json
end


get '/1.1/statuses/status.json' do
  content_type :json
  number_of_tweets = params['count'] || 30 # You can specify the count parameter in the URL
  get_tweets(number_of_tweets.to_i)
end


