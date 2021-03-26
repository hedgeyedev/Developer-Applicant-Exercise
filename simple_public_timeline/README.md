# Public Timeline Rails Application

## Install Rails App

1. Navigate to this folder in your terminal and `git clone git@github.com:srolandmarshall/public_timeline.git`
2. Navigate to the rails app `cd public_timeline`
3. In terminal, `ruby -v` to confirm you are using `ruby-2.5.8`. `rvm` and `rbenv` should detect from either `.ruby-version` or the `Gemfile`.
4. In terminal, `bundle install` (if you don't have Bundle configured, simply `gem install bundler`)

- _NOTE_: I did not use `rvm` for this project, so creating a gemset as specified in the application was out of scope without completely reconfiguring my ruby environment. However, `bundle` should work efficiently enough with any environment.

## Set up proxy

You will probably need to use a proxy for the JS page API implementation. I've made that very easy.

1. If you are in the Rails app directory, `cd ../` then `cd cors_anywhere`
2. `npm install cors-anywhere`
3. `node cors`

- You should see `Running CORS Anywhere on 0.0.0.0:8080`

## Using the app

### To start the app:
1. Navigate to the `public_timeline` folder in terminal
2. Enter `rails s` 
3. Open web browser and navigate to http://localhost:3000, if not automatically taken there. 

- If you encounter an error, you may have to do `bundle exec rake webpacker:install` because Rails 6 doesn't necessarily install this by default.

The app only has two routes: `/` and `/via_js`. Both pages have same content, but the `via_js` route loads the content client-side and modifies the DOM directly via JQuery.

## Run Tests
You can run the test spec within the Rails app by running `rake spec`
