// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require_tree .

$.get("/tweetsapi.json", function(resp) {
    $('.tweets_display').innerHTML = '';
    let tweets = resp.tweets
    for (tweet of tweets) {
        let source = tweet.source
        let timestamp = tweet.created_at
        let name = tweet.user.screen_name
        let imgSrc = tweet.user.profile_image_url_https
        let profilUrl = tweet.user.url
        let tweetTemplate = `
            <div class="row separator">
            </br>
                <div class="col-2">
                    <div class="pic">
                        <img class ="pic-size" src=${imgSrc} >
                    </div>
                </div>  
                <div class="col-10">
                    <div class="row">
                        <div class="name">
                            <a href=${profilUrl}>${name}</a>
                        <span class="tweet">${tweet.text}</span></div>
                    </div>
                    <div class="row">
                        <div class="timestamp">${timestamp} from 
                        ${source}</div>
                    </div>
                </div>
            </br>
            </div>
        `

        $('.tweets_display').append(tweetTemplate);
        console.log(tweet.text)
    }
});






   