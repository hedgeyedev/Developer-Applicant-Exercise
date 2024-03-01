require 'nokogiri'

class Post
  attr_reader :text, :reply, :source, :tweet_creation, :username, :profile_image, :profile_link

  def initialize(data)
    @text = data[:text]
    @reply = data[:in_reply_to_screen_name]
    @source = format_source(data[:source])
    @tweet_creation = format_time(data[:created_at])
    @username = data[:user][:screen_name]
    @profile_image = data[:user][:profile_image_url]
    @profile_link = data[:user][:url]
  end

private
  def format_source(source)
    doc = Nokogiri::HTML(source)
    doc.text.strip
  end

  def format_time(time)
    parts = time.split(" ")
    parts.pop(2)
    parts.join(" ")
  end
end
