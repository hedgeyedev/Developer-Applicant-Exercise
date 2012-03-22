require_relative 'text_converter'

class Tweet
  attr_reader :user, :id, :created_at, :source, :text
  
  def initialize options={}
    @user       = User.new options['user']
    @id         = options['id']
    @text       = options['text']
    @created_at = Time.parse(options['created_at']).utc
    @source     = options['source']
  end
  
  def to_json *args
    {:user => user, :id => id, :html_text => html_text, :created_at => created_at.iso8601, :source => source}.to_json *args
  end
  
  def html_text
    TextConverter.convert @text
  end
end

class User
  attr_reader :screen_name, :url, :name, :profile_image_url
  
  def initialize options={}
    @screen_name       = options['screen_name']
    @url               = options['url']
    @name              = options['name']
    @profile_image_url = options['profile_image_url']
  end
  
  def to_json *args
    {:url => url, :screen_name => screen_name, :name => name, :profile_image_url => profile_image_url}.to_json *args
  end
end