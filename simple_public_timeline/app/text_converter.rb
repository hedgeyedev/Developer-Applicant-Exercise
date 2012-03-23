require 'uri'

class TextConverter
  BASE_URL              = 'https://twitter.com'
  HASH_TAGS_PATTERN     = /(#([\w]+))([\W]|$)/u
  MENTIONS_PATTERN      = /(@([\w]+))([\W]|$)/u
  SUPPORTED_URL_SCHEMES = %w{http https ftp sftp ssh scp rcp git git+ssh}
  
  def self.convert text
    convert_hashtags( convert_user_mentions( convert_urls(text) ) )
  end
  
  def self.convert_hashtags text
    text.gsub(HASH_TAGS_PATTERN) do
      # a.tweet-url.hashtag{:href => "/search?q=%23thetimeis", :rel => "nofollow", :title => "#thetimeis"}
      "<a class='tweet-url hashtag' href='#{BASE_URL}/search?q=%23#{$2}' rel='nofollow' title='##{$2}'>##{$2}</a> "
    end
  end

  def self.convert_user_mentions text
    text.gsub(MENTIONS_PATTERN) do
      "<a class='tweet-url username' href='#{BASE_URL}/#{$2}' rel='nofollow'>@#{$2}</a> "
    end
  end
  
  def self.convert_urls text
    URI.extract(text, SUPPORTED_URL_SCHEMES).each do |match|
      text = text.gsub(match, "<a href='#{match}' target='_blank'>#{match}</a>")
    end
    text
  end
end