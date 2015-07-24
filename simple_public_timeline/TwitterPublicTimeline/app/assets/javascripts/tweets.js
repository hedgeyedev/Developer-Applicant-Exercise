getFormattedTime = function (fourDigitTime) {
    var hours24 = parseInt(fourDigitTime.substring(0, 2),10);
    var hours = ((hours24 + 7) % 12) + 1;
    var amPm = hours24 > 11 ? 'pm' : 'am';
    var minutes = fourDigitTime.substring(3);

    return hours + ':' + minutes + amPm;
};

$.ajax({
    url: '/api/twitter_json',
    method: 'GET',
    dataType: 'json',
    success: function(data) {
      $.each(data, function(index, tweet) {
        $('#tweets').append("<li class='tweet group'><img class='tweet-picture' src='" + tweet.user.profile_image_url + "' /><div class='tweet-body'><a href='https://twitter.com/" + tweet.user.screen_name + "'>" + tweet.user.screen_name + "</a>" + tweet.text + "<h4 class='tweet-time'>Created on " + tweet.created_at.slice(0, 10) + " at " + getFormattedTime(tweet.created_at.slice(11, 16)) + " " + tweet.source + "</h4></div></li>"
        );
      });
    }.bind(this)
  });
