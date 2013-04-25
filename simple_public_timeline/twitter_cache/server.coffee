EventEmitter = require('events').EventEmitter
fs = require 'fs'
levelup = require("levelup")
ttl = require 'level-ttl'
env = process.env


# most streaming message types can be shortcut due to predictable minification
# so we can do simple string checking here rather than decode the JSON
message_type = (message, type) ->
  len = type.length + 4
  message.substr(0, len) is "{\"#{type}\":"

# leveldb uses a byte lexicographical sort on keys, so lets keep everything
# the same number of bytes to ensure the correct sort. normally leveldb lets
# you pass in a comparator when creating a database so that you can override
# the sorting order of the data on disk, but this capability isn't exposed
# to node.js in the extension yet. Providing a sane API for that, when it
# normally expects to run a very simple and fast chunk of C++ code, would
# probably be a serious PITA to get right.
date_key = (date) ->
  plen = 16
  dnum = "#{date.valueOf()}"
  len = dnum.length
  if plen > len
    padding = Array(plen - len).join("0")
    dnum = "#{padding}#{dnum}"
  dnum


# this would be best refactored into smaller pieces with a single observer
# object handling orchestration of events.
class TwitterCache extends EventEmitter
  constructor: ->
    super(@)
    @on "message-parse-required", (message) =>
      @_parse_message(message)
    @on "tweet", (message) =>
      @db.put date_key(message.created_at), message,
        ttl: 1000 * 60 * 60

  start: ->
    @once "db-ready", (db) =>
      @db = db
      @connect()
    @once "db-error", (error) ->
      throw error
    @_open_database()

  connect: ->
    @once "client-auth-set", =>
      @_verify_credentials()
    @once "client-ready", (user) =>
      console.info "Authenticated as @#{user.screen_name}"
      @_stream_sample()
    @once "client-auth-error", (error) ->
      console.error "Authentication error"
      console.error """
      TWITTER_CONSUMER_KEY    : #{env.TWITTER_CONSUMER_KEY    || "<unset>"}
      TWITTER_CONSUMER_SECRET : #{env.TWITTER_CONSUMER_SECRET || "<unset>"}
      TWITTER_ACCESS_TOKEN    : #{env.TWITTER_ACCESS_TOKEN    || "<unset>"}
      TWITTER_ACCESS_SECRET   : #{env.TWITTER_ACCESS_SECRET   || "<unset>"}
      """
      throw error
    @client = require("twitter-api").createClient()
    @_set_client_auth()

  _open_database: =>
    levelup './twitter_cache.ldb',
      valueEncoding: 'json'
      createIfMissing: true
      compression: true
    , (err, db) =>
      if err
        @emit "db-error", err
      else
        db = ttl(db)
        @emit "db-ready", db

  _set_client_auth: =>
    try
      @client.setAuth(
        env.TWITTER_CONSUMER_KEY, env.TWITTER_CONSUMER_SECRET,
        env.TWITTER_ACCESS_TOKEN, env.TWITTER_ACCESS_SECRET
      )
      @emit "client-auth-set"
    catch error
      @emit "client-auth-error", error

  _verify_credentials: =>
    @client.get "account/verify_credentials",
      skip_status: true
    , (user, error, status) =>
      if user
        @emit "client-ready", user
      else
        @emit "client-auth-error", error

  _stream_sample: =>
    @client.stream "statuses/sample", {}, (message) =>
      event = switch
        when not message                              then 'message-blank'
        when message_type(message, "delete")          then 'message-delete'
        when message_type(message, "scrub_geo")       then 'message-scrub_geo'
        when message_type(message, "limit")           then 'message-limit'
        when message_type(message, "status_withheld") then 'message-status_withheld'
        when message_type(message, "user_withheld")   then 'message-user_withheld'
        when message_type(message, "disconnect")      then 'message-disconnect'
        when message_type(message, "warning")         then 'message-warning'
        when message_type(message, "friends")         then 'message-friends'
        else                                               'message-parse-required'
      @emit event, message

  _parse_message: (message) =>
    message = JSON.parse(message)
    if message.created_at
      message.created_at = new Date(message.created_at)
    if message.text
      @emit "tweet", message

  twenty_tweets: (callback) =>
    tweets = []
    @db.createReadStream
      reverse: true
      limit: 20
    .on 'data', (data) ->
      tweets.push(data.value)
    .on 'end', ->
      callback(tweets)


twitter_cache = new TwitterCache()
twitter_cache.start()


# dump 20 tweets into a cache file every 5 seconds
log_tweets = ->
  twitter_cache.twenty_tweets (tweets) ->
    fs.writeFile './twenty_tweets.json.new', JSON.stringify(tweets, null, "  "), ->
      fs.renameSync './twenty_tweets.json.new', './twenty_tweets.json'
      if tweets[0]
        console.info "Refreshed twenty_tweets.json @#{tweets[0].created_at}"
      else
        console.warn "Empty twenty_tweets.json"
      setTimeout log_tweets, 5000

# start writing out tweets half a second after receiving the first tweet
twitter_cache.once "tweet", ->
  setTimeout log_tweets, 500

