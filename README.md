# Web Developer Applicant Exercise

To be considered for a developer position at [Hedgeye](http://www.hedgeye.com), you must successfully complete these steps [**](#footnote)

**Please note:** your code will be tested on Ruby 2.7 or 3.2 and the latest version of Chrome.

1. Fork this repository
2. In the *why_hire_me* directory
    * Add a file `cover_letter.txt` with cover letter type verbiage.
    * Fill out the `questionnaire.txt` and commit it
    * Anything else we should know.  For example, one of your preferred development tools (editor, desktop app, etc.) and why you use it.
3. In the *simple_refactoring_exercise* directory you will find some Ruby code that needs to be refactored.
    * An rspec spec is provided
    * Please [refactor](http://www.refactoring.com) the implementation.  Clarity and duplication are a given, flawed implementation is also likely.
    * Please note: feel free to change the specs, but they should all be passing when you turn in your code.
    * Leave a note about what you refactored and why.  Calling specific named smells and specific named refactorings should be the norm.
4. In the *simple_public_timeline* directory, please create a simple web app (use the Ruby framework of your choice. Suggestion: Sinatra is good for a tiny app like this) that looks close to the middle column in logged out state of the now defunct http://twitter.com/public_timeline shown below
![Twitter public timeline](https://raw.github.com/hedgeyedev/Developer-Applicant-Exercise/master/images/twitter_public_timeline.png)
    * A headline with "Recent Public Tweets"
    * A smaller headline "What everyone on Twitter is talking about"
    * Displays 20 entries from twitter's public timeline.  Use the data/API of your choice
        * For each entry, show the profile image, a link to the users profile, the tweet text, the time of the tweet, and source (i.e. "via Twitter for Android")
        * Barebones style is adequate.  No need for nice CSS or text wrapping.  But if you can do it, extra credit
    * Provide the previously described view in 2 ways
        1. Have the route `/` retrieve the Twitter data on the server side and then render
        2. Have the route `/via_js` retrieve the Twitter data with JavaScript and render it after the document loads
    * Required
        * `.ruby-version`, `.ruby-gemset` and `Gemfile`
        * at least 1 spec.  More means extra credit
    * Tips
        * Do use gems, and JavaScript libraries.
        * If you are Ruby, JavaScript, and web development savvy, it shouldn't take you that long.  A sample implementation, sans specs, is less than 100 lines of text total.
        * Don't get caught up on styling, that's what designers are for.  But extra credit for improved styling, and/or looking like the original
        * Be careful with Twitter's rate limiting while testing.
        * Since Elon Musk took over twitter, free API is not useful - feel free to use https://github.com/hedgeyedev/fake_twitter_api as the data source. ~Since Twitter retired the public_timeline, getting the last 20 entries is harder than it used to be.  I suggest something like https://github.com/intridea/tweetstream for ruby for access to sample (https://stream.twitter.com/1.1/statuses/sample.json).  There are other clever ways to get around that and a stream that looks like the old status~
        * Write good code that you want people to see.
6. Commit and Push your code to your fork
7. Send a pull request, we will review your code and get back to you.  If your GitHub profile does not include your name, please include your name in the pull request.



<a name="footnote"></a>** The awesome idea of github pull request as
job application task was previously done by [Integrum](http://integrumtech.com) [here](https://github.com/integrum/job-application)
