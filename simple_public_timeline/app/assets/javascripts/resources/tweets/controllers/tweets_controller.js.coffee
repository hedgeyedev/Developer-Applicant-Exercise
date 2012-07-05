Tweets.tweetsController = Em.ArrayController.create
	content: [],
	twitter_api_url: "http://api.twitter.com/1/statuses/public_timeline.json?count=3&include_entities=true"

	init: () ->
		@_super()
		twt = this
		url = twt.twitter_api_url
		$.ajax url,
			type: 'GET'
			dataType: 'jsonp'
			success: (data) ->
				data.map (s) ->
					tweet = Tweets.Tweet.create
						id: s.id
						source: s.source
						created_at: s.created_at
						text: s.text
						user_screen_name: s.user.screen_name
						user_profile_image_url: s.user.profile_image_url
						user_name: s.user.name					
					twt.pushObject(tweet) 
