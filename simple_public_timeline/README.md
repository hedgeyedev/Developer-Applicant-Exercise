In the *simple_public_timeline* directory, please create a simple web app (use the Ruby framework of your choice. Suggestion: Sinatra is good for a tiny app like this) that looks close to the middle column in logged out state of the now defunct http://twitter.com/public_timeline shown below
![Twitter public timeline](https://raw.github.com/hedgeyedev/Developer-Applicant-Exercise/master/images/twitter_public_timeline.png)
    * A headline with "Recent Public Tweets"
    * A smaller headline "What everyone on Twitter is talking about"
    * Displays 20 entries from twitter's public timeline.  Use the data/API of your choice
        * For each entry, show the profile image, a link to the users profile, the tweet text, the time of the tweet, and source (i.e. "via Twitter for Android")
        * Barebones style is adequate.  No need for nice CSS or text wrapping.
    * Provide the previously described view in 2 ways
        1. Have the route `/` retrieve the Twitter data on the server side and then render
        2. Have the route `/via_js` retrieve the Twitter data with JavaScript and render it after the document loads
    * Required
        * `.rvmrc` and `Gemfile`
        * at least 1 spec
    * Tips
        * Do use gems, and JavaScript libraries.  
        * If you are Ruby, JavaScript, and web development savvy, it shouldn't take you that long.  A sample implementation, sans specs, is less than 100 lines of text total.
        * Don't get caught up on styling, that's what designers are for.
        * Be careful with Twitter's rate limiting while testing.
        * Since Twitter retired the public_timeline, getting the last 20 entries is harder than it used to be.  I suggest something like https://github.com/intridea/tweetstream for ruby for access to sample (https://stream.twitter.com/1.1/statuses/sample.json).