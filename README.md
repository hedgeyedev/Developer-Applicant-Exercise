# Web Developer Applicant Exercise

To be considered for a developer position at [Hedgeye](http://www2.hedgeye.com), you must successfully complete these steps [**](#footnote)

1. Fork this repository
2. In the *why_hire_me* directory
 * Add a file cover_letter.txt with cover letter type verbiage.
 * Add a file that describes one of your preferred development tools (editor, desktop app, etc.) and why you use it 
 * Fill out the questionnaire.txt
 * Anything else we should know
3. In the *simple_refactoring_exercise* directory you will find some Ruby code that needs to be refactored.
 * An rspec spec is provided
 * Please [refactor](http://www.refactoring.com) this code
 * Please note: feel free to change the specs, but they should all be passing when you turn in your code.
 * Leave a note what you refactored and why.  Smells and specific refactorings are good.
4. In the *simple_public_timeline* directory, please create a simple (Ruby Framework of your choice, (suggestion: Sinatra is good for a tiny app like this)) web app that looks close to the middle column in logged out state of http://twitter.com/public_timeline
 * A headline with "Recent Public Tweets"
 * A smaller headline "What everyone on Twitter is talking about"
 * Displays 20 entries from twitter's public timeline.  Use the data/API of your choice
   * For each entry, show:
     * image profile on the left
     * a "stack" on the right including a link to the users profile, followed by the tweet text on the same line.  Below that the relative time of the tweek (i.e. 1 minute ago) and source attribution (i.e. "via Twitter for Android")
     * Barebones style ok.  No need for nice css, text wrapping, but bonus if you do it.
 * Required
   * .rvmrc and Gemfile
   * at least 1 spec
 * Optional (Extra Credit)
   * Comprehensive specs
   * More/Nicer Styling
   * More things that look like the original
5. Commit and Push your code to your fork
6. Send a pull request, we will review your code and get back to you



<a name="footnote">**</a>: The awesome idea of github pull request as
job application task was previously done by [Integrum](http://integrumtech.com) [here](https://github.com/integrum/job-application)
