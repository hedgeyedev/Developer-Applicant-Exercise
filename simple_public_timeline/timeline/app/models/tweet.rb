class Tweet < ActiveRecord::Base
  scope :known, -> {where language: Tweet.lang_map.keys}

  def self.fetch_create(limit = 40, language = nil)
    count = 0
    TweetStream::Client.new.sample do |status|
      tweet = Tweet.find_or_create_by_uid(status.id)
      tweet.update_attributes(
        name: status.user.name,
        screen_name: status.user.screen_name,
        profile_image_url: status.user.profile_image_url,
        content: status.text,
        published_at: status.created_at,
        source: status.source,
        language: status.lang
      ) 
      count += 1# if tweet.language == language || language.nil? || language.blank?
      break if count >= limit
    end
    if language.blank?
      self.order('created_at desc').limit(limit)
    else
      self.where(language: language).order('created_at desc').limit(limit)
    end
  end

  def language_in_words
    Tweet.lang_map[self.language] || 'others'
  end

  def options_for_language
    {language_in_words => self.language}
  end

  def self.lang_map
    {
      'ar' => 'Arabic', 
      'eu' => 'Basque',
      'ca' => 'Catalan', 
      'cs' => 'Czech', 
      'da' => 'Danish', 
      'nl' => 'Dutch', 
      'en' => 'US English', 
      'en-gb' => 'UK English', 
      'fa' => 'Farsi', 
      'fil' => 'Filipino', 
      'fi' => 'Finnish', 
      'fr' => 'French', 
      'gl' => 'Galician', 
      'de' => 'German', 
      'el' => 'Greek', 
      'he' => 'Hebrew', 
      'hi' => 'Hindi', 
      'hu' => 'Hungarian', 
      'id' => 'Indonesian', 
      'it' => 'Italian', 
      'ja' => 'Japanese', 
      'ko' => 'Korean', 
      'no' => 'Norwegian', 
      'pl' => 'Polish', 
      'pt' => 'Portuguese', 
      'ro' => 'Romainian', 
      'ru' => 'Russian', 
      'es' => 'Spanish', 
      'sv' => 'Swedish', 
      'th' => 'Thai', 
      'tr' => 'Turkish', 
      'uk' => 'Ukranian', 
      'ur' => 'Urdu', 
      'lolc' => 'Lolcatz', 
      'msa' => 'Malay', 
      'zh-cn' => 'Simplified Chinese', 
      'zh-tw' => 'Traditional Chinese'
    }
  end
end
