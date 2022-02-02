# How to use this app.

This Sinatra app can be run by calling `ruby hedgeye_twitter.rb` in the `simple_public_timeline` directory. It provides two routes, the root `/` and also `/via_js`. Please enjoy the javascript impementation's search feature!

## Setup

### Ruby versions

I use `asdf` locally to configure my ruby version. It does not create gemsets like `rvm` used to. It uses the `.tool-versions` file found in the above directory.

### Environment variables

This app uses the Dotenv ruby gem. Please create a file called `.env` in this directory. It should look like this:
```
TWITTER_CONSUMER_KEY=
TWITTER_CONSUMER_SECRET=
ACCESS_TOKEN=
ACCESS_TOKEN_SECRET=
```
Populate it with values from a Twitter Developer App that has the Elevated access level as the `search` query requires it.

## Testing

You can run the tests by running `rspec` in the `simple_public_timeline` directory.

There are various TODOs I would have liked to implement with more effort:
- error states on empty javascript search
- robust testing of the javascript front-end
- highlighting and parsing links and displaying media in the tweets