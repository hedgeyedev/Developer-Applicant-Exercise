Tweets.Tweet = Ember.Object.extend
	id: null,
	source: null,
	created_at: null,
	text: null,
	user_screen_name: null,
	user_profile_image_url: null,
	user_name: null,
	user_twitter_account_url: Ember.computed ->
		"https://twitter.com/" + this.user_screen_name
	user_timeline_account_url: Ember.computed ->
		"https://twitter.com/" + this.user_screen_name + "/status/" + this.id
	time_from_creation: Ember.computed ->
		time_left =  Math.ceil(Math.abs((new Date(this.created_at) - new Date)/1000)/60)
		if time_left > 1
			time_left + " minutes" 
		else
			time_left + " minute"
	escape_source: Ember.computed ->
		new Handlebars.SafeString this.source
		
		
