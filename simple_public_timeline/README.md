# Install Rails App

1. Navigate to this folder in your terminal and `git clone git@github.com:srolandmarshall/public_timeline.git`
2. Configure Ruby environment to make sure you're using the right version (2.5.8, as specified in the README of the application repo)
3. `cd`
4. `bundle install` (if you don't have Bundle configured, simply `gem install bundler`)

- NOTE: I did not use `rvm` for this project, so creating a gemset as specified in the application was out of scope without completely reconfiguring my ruby environment. However, `bundle` should work efficiently enough with any environment.

- You may have to do `bundle exec rake webpacker:install` because Rails 6 is weird and doesn't necessarily install this by default.

## Set up proxy

You will probably need to use a proxy for the JS page API implementation. I've made that very easy.

1. If you are in the Rails app directory, `cd ../` then `cd cors_anywhere`
2. `npm install cors-anywhere`
3. `node cors`

- You should see `Running CORS Anywhere on 0.0.0.0:8080`

## Using the app

To start the Rails server, navigate to the Rails app folder (named `public_timeline` by default and typing `rails s` into Terminal

The app only has two routes: `/` and `/via_js`. Both pages have same content, but the `via_js` route loads the content client-side and modifies the DOM directly via JQuery.

You can run the test suite within the Rails app by running `rake spec`
