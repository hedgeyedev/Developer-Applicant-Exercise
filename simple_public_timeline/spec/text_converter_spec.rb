require_relative '../app/text_converter'

describe TextConverter do
  def hashtag_links tags
    tags.map do |tag|
      "<a class='tweet-url hashtag' href='https://twitter.com/search?q=%23#{tag}' rel='nofollow' title='##{tag}'>##{tag}</a>"
    end
  end
  
  def mentions_links people
    people.map do |user|
      "<a class='tweet-url username' href='https://twitter.com/#{user}' rel='nofollow'>@#{user}</a>"
    end
  end
  
  def url_links urls
    urls.map do |url|
      "<a href='#{url}' target='_blank'>#{url}</a>"
    end
  end
  
  it "should replace hashtags with links" do
    { "#hashtag" => %w{hashtag}, 
      "text with one #tag in it" => %w{tag},
      "text #with multiple #tags #embedded" => %w{with tags embedded} }.each_pair do | text, tags |

      converted_text = TextConverter.convert_hashtags(text)
      hashtag_links(tags).each do |link|
        converted_text.should include(link)
      end
    end
  end
  
  it "should replace mentions with links" do
    { "@someone" => %w{someone}, 
      "text with one @mention in it" => %w{mention},
      "text #with multiple @people @embedded" => %w{people embedded} }.each_pair do | text, tags |

      converted_text = TextConverter.convert_user_mentions(text)
      mentions_links(tags).each do |link|
        converted_text.should include(link)
      end
    end
  end
  
  it "should replace URLs with links" do
    hash = {
      "http://foo.com" => %w{http://foo.com}, 
      "text with one URL in it: https://example.com" => %w{https://example.com},
      "text with multiple scp://one ftp://two sftp://three git+ssh://something/git" => %w{scp://one ftp://two sftp://three git+ssh://something/git} }
      
    hash.each_pair do | text, tags |
      converted_text = TextConverter.convert_urls(text)
      url_links(tags).each do |link|
        converted_text.should include(link)
      end
    end
  end
  
  it "should convert hashtags, mentions, and URLs to links" do
    text = "text #with @multiple @links #embedded: scp://one ftp://two sftp://three git+ssh://something/git"
    expected  = "text #{hashtag_links(%w{with}).join} "
    expected += "#{mentions_links(%w{multiple links}).join(' ')} "
    expected += "#{hashtag_links(%w{embedded}).join}  "
    expected += "#{url_links(%w{scp://one ftp://two sftp://three git+ssh://something/git}).join(' ')}"
    TextConverter.convert(text).should == expected
  end
end