require 'ostruct'
require 'json'

get '/' do
  haml :index, :locals => {:statuses => JSON(File.read("spec/tweets.json")).map{|e| user=e.delete('user') ; os = OpenStruct.new(e); os.user=OpenStruct.new(user); os }}
end

# user:
#   name
#   profile_image_url
#   url
# id
# text
# created_at
# source

# <link [url]>[name]</link> [text]
# [relative time] via [source]