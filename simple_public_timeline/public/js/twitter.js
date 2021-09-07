$(document).ready(function () {
    let tweets = []
    $.ajax({
        url: "/twitter_json",
        type: "GET",
        success: displayTweets
    })

    function displayTweets(tweets) {
        $("#twitter-tweet").empty()
        tweets.forEach(tweet => {
            let parsed_tweet = JSON.parse(tweet)
            $("#twitter-tweet").append(
                "<img src=" + parsed_tweet.user.profile_image_url_https + " />"
                + "<a href=" + parsed_tweet.user.url + ">" + parsed_tweet.user.name + "</a>"
                + "<br /><p>" + parsed_tweet.text + "</p>"
                + "<br />" + parsed_tweet.created_at + " from " + parsed_tweet.source + "<br /><br />"
            )
        })
    }
})