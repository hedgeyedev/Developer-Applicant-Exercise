class TwitterTimeline
  def self.public_timeline
    Rails.cache.fetch('public_timeline', expires_in: 30.seconds, race_condition_ttl: 10.seconds) do
      transform(fetch)
    end
  end

  def self.fetch
    JSON.parse(HTTParty.get('https://api.twitter.com/2/tweets/search/recent?query=covid&tweet.fields=created_at,source&expansions=author_id&user.fields=profile_image_url&max_results=20', headers: { Authorization: "Bearer #{TWITTER_TOKEN}" }).body)
  end

  def self.transform(twitter_hash)
    tweets = []
    twitter_hash['data'].each do |tweet|
      result = { text: tweet['text'], created_at: tweet['created_at'], source: tweet['source'] }
      user = twitter_hash['includes']['users'].select { |user| user['id'] == tweet['author_id']}&.first || {}
      result[:username] = user.dig('username')
      result[:profile_image_url] = user.dig('profile_image_url')
      tweets.append(result)
    end
    tweets
  end
end
