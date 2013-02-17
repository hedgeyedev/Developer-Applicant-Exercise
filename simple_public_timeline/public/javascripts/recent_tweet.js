window.onload = function() {
    loadTweetStream();
};

function loadTweetStream() {
    var url = "https://stream.twitter.com/1.1/statuses/sample.json?delimited=length"
    var req = new XMLHttpRequest({mozSystem: true});
    req.open('GET', url, true, '<username>', '<password>');  
    req.onreadystatechange = function() {
        if(req.readyState == 3){ 
            var count = 0;
            var responseText = req.responseText;
            var pos = responseText.indexOf("in_reply_to_status_id_str");
            while (pos != -1) {
                count++;
                pos = responseText.indexOf("in_reply_to_status_id_str",pos + 1);
            }
            if(count > 20) {
                var tweets = parseResponseText(req.responseText);
                var tweetlist = buildTweetList(tweets);
                document.getElementById("twitter-feed").innerHTML=tweetlist;    
                req.abort();    
            }                     
        }    
    };  
    req.send();
}

function parseResponseText(text) {
    var tweets = new Array();
    var re = /(\d{4}\s*{"created_at":)/;
    var pos = text.search(re);
    while(pos != -1) {
        var charcount = parseInt(text.substring(pos, pos + 4));
        var tweetstring = text.slice(pos + 5, pos + charcount + 5);
        if(IsJsonString(tweetstring)) {
            var tweet = JSON.parse(tweetstring);
            tweets.push(tweet);
        } else {
            alert("Invalid JSON!" + tweetstring);
            break
        }
        text = text.slice(pos + charcount + 5);
        pos = text.search(re);
    }
    return tweets;
}

function IsJsonString(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }       
    return true;
}

function buildTweetList(tweet_array) {
    var tweetlist = "";
    for (var i = 0; i < 20; i++) {
        var tweet = tweet_array[i];
        var htmlstring = '<div class="tweet">\
<a href="http://twitter.com/' + tweet.user.screen_name + '">\
<img src=' + tweet.user.profile_image_url + ' class="profile-image"></a>\
<a href="http://twitter.com/' + tweet.user.screen_name + '" class="profile-name">' + tweet.user.screen_name + '</a><span class="status_text">' + tweet.text + '</span><br />\
<span div="tweet_info">Posted at ' + tweet.created_at + ' from ' + tweet.source + '</div>';
        tweetlist += htmlstring;
    }
    return tweetlist;
}