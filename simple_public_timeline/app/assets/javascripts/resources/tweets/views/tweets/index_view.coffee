Tweets.IndexView = Ember.View.extend
	templateName: 'resources/tweets/templates/tweets/index_template'
	tagName: 'div'
	tweetBinding: 'Tweets.tweets.content'
	controllerBinding: 'Tweets.tweetsController'
