require 'rails_helper'

RSpec.describe Post do
  it 'creates a post poro based on attributes' do
    attr =  
    [
      {
          "text": "Bird life around him forward.",
          "truncated": true,
          "in_reply_to_user_id": nil,
          "in_reply_to_status_id": nil,
          "favorited": false,
          "source": "<a href=\"http://twitter.com/\" rel=\"nofollow\"><a href=\"http://twitter.com/\" rel=\"nofollow\">Twitter for iPhone</a></a>",
          "in_reply_to_screen_name": nil,
          "in_reply_to_status_id_str": nil,
          "id_str": "da7e61e456489ec1efe3",
          "entities": {
              "user_mentions": [],
              "urls": [],
              "hashtags": []
          },
          "contributors": nil,
          "retweeted": false,
          "in_reply_to_user_id_str": nil,
          "place": nil,
          "retweet_count": 10,
          "created_at": "Thu Feb 29 13:41:49 +0000 2024",
          "retweeted_status": nil,
          "user": {
              "notifications": nil,
              "profile_use_background_image": true,
              "statuses_count": 112,
              "profile_background_color": "C0DEED",
              "followers_count": 235,
              "profile_image_url": "https://picsum.photos/id/47/50/50",
              "listed_count": 8,
              "profile_background_image_url": "http://example.com/bg_image.jpg",
              "description": "Sample description",
              "screen_name": "david_marioni",
              "default_profile": true,
              "verified": false,
              "time_zone": "UTC",
              "profile_text_color": "333333",
              "is_translator": false,
              "profile_sidebar_fill_color": "DDEEF6",
              "location": "Sample location",
              "id_str": "3a5c8a286b882a48",
              "default_profile_image": false,
              "profile_background_tile": false,
              "lang": "en",
              "friends_count": 145,
              "protected": false,
              "favourites_count": 3,
              "created_at": "Thu Feb 29 13:41:49 +0000 2024",
              "profile_link_color": "0084B4",
              "name": "Sample User",
              "show_all_inline_media": false,
              "follow_request_sent": nil,
              "geo_enabled": false,
              "profile_sidebar_border_color": "C0DEED",
              "url": "http://twitter.com/david_marioni",
              "id": 50998,
              "contributors_enabled": false,
              "following": nil,
              "utc_offset": -28800
          },
          "id": 4248,
          "coordinates": nil,
          "geo": nil
      }
    ]

    post = Post.new(attr.first)

    expect(post).to be_a(Post)
    expect(post.profile_image).to eq('https://picsum.photos/id/47/50/50')
    expect(post.profile_link).to eq('http://twitter.com/david_marioni')
    expect(post.reply).to be(nil)
    expect(post.source).to eq('Twitter for iPhone')
    expect(post.text).to eq('Bird life around him forward.')
    expect(post.tweet_creation).to eq('Thu Feb 29 13:41:49')
    expect(post.username).to eq('david_marioni')
  end
end