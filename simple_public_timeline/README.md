# README

This is a simple public timeline like the old Twitter public timeline

## Ruby version
Using Ruby 3.2.2

## Rails version
Using Rails 7.1.2

## How to run the test suite

```
 bundle exec rspec
```

## Services
Locally, to start the fake_twitter_api, we must use this in the directory for fake_twitter_api:
```
ruby main.rb --cors 3000
```

Note that the --cors option prevents CORS errors when hitting the API from JavaScript.


