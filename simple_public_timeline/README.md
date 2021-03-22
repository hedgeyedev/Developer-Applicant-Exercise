# Setup

## 1. Twitter API Access

Create the file: config/secrets.yml and add your Twitter API consumer key secret and access token.(App secret and keys were intentionally omitted from the repo.)

- These are found under the Twitter Developer Portal > Projects & Apps. Then click on the settings & tokens tab and click the "Generate" button

  ```
  development:
    consumer_key: "your key"
    consumer_secret: "your secret"
    access_token: "access_token"
    access_secret: "access_secret"
  ```

## 2. Installation

CD into `simple_public_timeline` and Ruby version 2.5.8. Check with `ruby -v`

Next Install Gems:

```
bundle install
```

Make sure yarn is installed. Rails favors yarn, so I stuck with that. See [yarnpkg.com](https://classic.yarnpkg.com/en/docs/instal) for details.

```
yarn install
```

Compile the assets. This will build the front end contained under **app/javascript**.

```
rake assets:precompile
```

(You can also build the front end directly with webpack `bin/webpack`)

Run the rails development server:

```
rails server
```

## 3. Overview

Rails, Webpack, and TypeScript were likely overkill for this exercise. I'm fairly new to Rails and wanted to use this as an opportunity to work through setting up Rails from the start. I've been using the react-rails pattern for interactive charting components and find it really cool.

I approached this by first experimenting and learning about the Twitter API, and followed the suggestion to use the `TweetStream` gem to get the tweets. Since TweetStream runs continuously, I decided to create a singleton to get 20 most recent tweets, and put them into a store that the application can read. This way the tweets are synced between the root and /via_js routes. As a bonus I added a scheduling library to fetch 20 new tweets every five minutes.

For rendering the tweets, I set up a container layout for both routes `root` and `via_js.` Via_js uses react-rails to render a React component. The react component makes a `GET` request using fetch to `/via_js` which returns a JSON object of the tweets.

The main files to look at are:

- `app/lib/tweets_auth.rb`  
  Singleton that makes the request to the Twitter API for the tweets
- `app/initializers/latest_tweets.rb` An initializer that the application uses to store and read tweets
- `app/controllers/tweets_controller.rb` This is the controller for the root and via_js url. The via_js url returns the same layout, but renders the tweets using a React component.
- `app/javascript` Contains the javascript components that render the tweets. And a helper to display the time in the same format as Rails
