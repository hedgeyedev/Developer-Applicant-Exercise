#
# This file is part of simple_public_timeline. Copyright (C) 2013 and above Shogun <shogun@cowtech.it>.
# Licensed under the MIT license, which can be found at http://www.opensource.org/licenses/mit-license.php.
#

module MainHelper
  def parse_entities(tweet)
    (parse_hashtags(tweet) + parse_urls(tweet) + parse_users(tweet)).sort {|a, b| a[0] <=> b[0]}
  end

  def text_with_active_entities(tweet)
    entities = parse_entities(tweet)
    rv = tweet.text.dup
    offset = 0

    entities.each do |entities|
      from = entities[0] + offset
      to = entities[1] + offset
      replacement = entities[2]

      offset += replacement.length - (to - from)
      rv[(from...to)] = replacement
    end

    rv.html_safe
  end

  private
    def parse_hashtags(tweet)
      tweet.hashtags.map {|hashtag|
        hashtag.indices + [link_to("##{hashtag.text}", "https://twitter.com/search?q=%23#{hashtag.text}", target: :blank)]
      }
    end

    def parse_urls(tweet)
      (tweet.media + tweet.urls).map {|url| url.indices + [link_to(url.url.to_s, url.url.to_s, target: :blank)] }
    end

    def parse_users(tweet)
      tweet.user_mentions.map {|mention|
        mention.indices +
        [link_to("@#{mention.screen_name}", "https://twitter.com/#{mention.screen_name}", target: :blank, rel: :tooltip, title: mention.name)]
      }
    end
end
