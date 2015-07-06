# Simple Public Timeline

This Volt powered app was created as part of a coding challenge for a job application to Hedgeye.  The requirements were that there be 2 routes:

 - Have the route / retrieve the Twitter data on the server side and then render
 - Have the route /via_js retrieve the Twitter data with JavaScript and render it after the document loads

I did neither of these because I made the app in the most cutting edge framework Volt, that runs Ruby code on both the server and client.

I created a Task that gets the tweets using the twitter gem.  The app then calls that task (effectively using the server as a proxy between the client and Twitter API), then renders the document and displays the tweets when they arrive.  There is absolutely no JavaScript used.

A spec that tests the TwitterTasks is in the folder /spec/app/main/tasks/

Run it with this system command

    $ BROWSER=/Users/maxplomer/.phantomjs/1.9.8/darwin/bin/phantomjs bundle exec rspec