// Generated by CoffeeScript 1.6.2
(function() {
  var EventEmitter, TwitterCache, date_key, env, fs, levelup, log_tweets, message_type, ttl, twitter_cache,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  EventEmitter = require('events').EventEmitter;

  fs = require('fs');

  levelup = require("levelup");

  ttl = require('level-ttl');

  env = process.env;

  message_type = function(message, type) {
    var len;
    len = type.length + 4;
    return message.substr(0, len) === ("{\"" + type + "\":");
  };

  date_key = function(date) {
    var dnum, len, padding, plen;
    plen = 16;
    dnum = "" + (date.valueOf());
    len = dnum.length;
    if (plen > len) {
      padding = Array(plen - len).join("0");
      dnum = "" + padding + dnum;
    }
    return dnum;
  };

  TwitterCache = (function(_super) {
    __extends(TwitterCache, _super);

    function TwitterCache() {
      this.twenty_tweets = __bind(this.twenty_tweets, this);
      this._parse_message = __bind(this._parse_message, this);
      this._stream_sample = __bind(this._stream_sample, this);
      this._verify_credentials = __bind(this._verify_credentials, this);
      this._set_client_auth = __bind(this._set_client_auth, this);
      this._open_database = __bind(this._open_database, this);
      var _this = this;
      TwitterCache.__super__.constructor.call(this, this);
      this.on("message-parse-required", function(message) {
        return _this._parse_message(message);
      });
      this.on("tweet", function(message) {
        return _this.db.put(date_key(message.created_at), message, {
          ttl: 1000 * 60 * 60
        });
      });
    }

    TwitterCache.prototype.start = function() {
      var _this = this;
      this.once("db-ready", function(db) {
        _this.db = db;
        return _this.connect();
      });
      this.once("db-error", function(error) {
        throw error;
      });
      return this._open_database();
    };

    TwitterCache.prototype.connect = function() {
      var _this = this;
      this.once("client-auth-set", function() {
        return _this._verify_credentials();
      });
      this.once("client-ready", function(user) {
        console.info("Authenticated as @" + user.screen_name);
        return _this._stream_sample();
      });
      this.once("client-auth-error", function(error) {
        console.error("Authentication error");
        console.error("TWITTER_CONSUMER_KEY    : " + (env.TWITTER_CONSUMER_KEY || "<unset>") + "\nTWITTER_CONSUMER_SECRET : " + (env.TWITTER_CONSUMER_SECRET || "<unset>") + "\nTWITTER_ACCESS_TOKEN    : " + (env.TWITTER_ACCESS_TOKEN || "<unset>") + "\nTWITTER_ACCESS_SECRET   : " + (env.TWITTER_ACCESS_SECRET || "<unset>"));
        throw error;
      });
      this.client = require("twitter-api").createClient();
      return this._set_client_auth();
    };

    TwitterCache.prototype._open_database = function() {
      var _this = this;
      return levelup('./twitter_cache.ldb', {
        valueEncoding: 'json',
        createIfMissing: true,
        compression: true
      }, function(err, db) {
        if (err) {
          return _this.emit("db-error", err);
        } else {
          db = ttl(db);
          return _this.emit("db-ready", db);
        }
      });
    };

    TwitterCache.prototype._set_client_auth = function() {
      var error;
      try {
        this.client.setAuth(env.TWITTER_CONSUMER_KEY, env.TWITTER_CONSUMER_SECRET, env.TWITTER_ACCESS_TOKEN, env.TWITTER_ACCESS_SECRET);
        return this.emit("client-auth-set");
      } catch (_error) {
        error = _error;
        return this.emit("client-auth-error", error);
      }
    };

    TwitterCache.prototype._verify_credentials = function() {
      var _this = this;
      return this.client.get("account/verify_credentials", {
        skip_status: true
      }, function(user, error, status) {
        if (user) {
          return _this.emit("client-ready", user);
        } else {
          return _this.emit("client-auth-error", error);
        }
      });
    };

    TwitterCache.prototype._stream_sample = function() {
      var _this = this;
      return this.client.stream("statuses/sample", {}, function(message) {
        var event;
        event = (function() {
          switch (false) {
            case !!message:
              return 'message-blank';
            case !message_type(message, "delete"):
              return 'message-delete';
            case !message_type(message, "scrub_geo"):
              return 'message-scrub_geo';
            case !message_type(message, "limit"):
              return 'message-limit';
            case !message_type(message, "status_withheld"):
              return 'message-status_withheld';
            case !message_type(message, "user_withheld"):
              return 'message-user_withheld';
            case !message_type(message, "disconnect"):
              return 'message-disconnect';
            case !message_type(message, "warning"):
              return 'message-warning';
            case !message_type(message, "friends"):
              return 'message-friends';
            default:
              return 'message-parse-required';
          }
        })();
        return _this.emit(event, message);
      });
    };

    TwitterCache.prototype._parse_message = function(message) {
      message = JSON.parse(message);
      if (message.created_at) {
        message.created_at = new Date(message.created_at);
      }
      if (message.text) {
        return this.emit("tweet", message);
      }
    };

    TwitterCache.prototype.twenty_tweets = function(callback) {
      var tweets;
      tweets = [];
      return this.db.createReadStream({
        reverse: true,
        limit: 20
      }).on('data', function(data) {
        return tweets.push(data.value);
      }).on('end', function() {
        return callback(tweets);
      });
    };

    return TwitterCache;

  })(EventEmitter);

  twitter_cache = new TwitterCache();

  twitter_cache.start();

  log_tweets = function() {
    return twitter_cache.twenty_tweets(function(tweets) {
      return fs.writeFile('./twenty_tweets.json.new', JSON.stringify(tweets, null, "  "), function() {
        fs.renameSync('./twenty_tweets.json.new', './twenty_tweets.json');
        if (tweets[0]) {
          console.info("Refreshed twenty_tweets.json @" + tweets[0].created_at);
        } else {
          console.warn("Empty twenty_tweets.json");
        }
        return setTimeout(log_tweets, 500);
      });
    });
  };

  twitter_cache.once("tweet", function() {
    return setTimeout(log_tweets, 500);
  });

}).call(this);
