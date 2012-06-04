var SPT = {
  recentTweets: "",

  initialize: function() {
    SPT.retrieveTwitterPublicTimeline(20);
  },

  retrieveTwitterPublicTimeline: function(count) {
    $.getJSON("http://twitter.com/statuses/public_timeline.json?count=20&callback=?")
      .success(function(data) {
        SPT.recentTweets = data;
        SPT.displayTweets();
      })
      .error(function() {
        alert("Error, unable to load tweets.");
      })
  },

  displayTweets: function() {
    $('#tweets').html(' ');
    $(SPT.recentTweets).each(function(index, tweet){
      $('#tweets')
        .append($('<div class="tweet">')
          .append($('<img>').attr('src', tweet['user']['profile_image_url']))
          .append($('<p>').html(tweet['text']))
          .append($('<a>').attr('href', "http://twitter.com/" + tweet['user']['screen_name'])
            .text(tweet['user']['screen_name']))
          .append($('<span>').text("Tweeted at: " + tweet['created_at']))
          .append($('<span>').html("Source: " + tweet['source'])));
    });

  }
};

// Lets get the ball rolling..
$(function(){
  SPT.initialize();
});

// In a more complicated application I tend toward a javascript structure and initialization similar to: http://viget.com/inspire/extending-paul-irishs-comprehensive-dom-ready-execution
