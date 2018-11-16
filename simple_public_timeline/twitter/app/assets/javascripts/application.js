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
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(function() {
console.log("doc ready!")

    // function search(search_term) {
    //     console.log('searching for ');
    //     console.log(search_term);

        var search_term = {
            q: 'bowery'
        };

        console.log(search_term);

        $.ajax({
            url:'https://api.twitter.com/1.1/statuses/mentions_timeline.json?' + $.param(search_term),
            dataType:'jsonp',
            success:function(data) {
                console.log(data);

                for (item in data['result']){
                    $('#tweets').appen(
                        '<li>' + data['results'][item]['text'] + '</li>'
                        );
                }
            }

        })



    // }

	// $.ajax({
 //        type:'GET',
 //        dataType:'json',
 //        url:'https://stream.twitter.com/1.1/statuses/sample.json',
 //        data:{screen_name:'USERNAME', include_rts:1}, //show retweets
 //        success:function(data, textStatus, XMLHttpRequest) {
 //            var tmp = false;
 //            var results = $('#twitter_results');
 //            //console.log(data);
 //            for(i in data) {
 //                if(data[i].retweeted_status != null) {
 //                    tmp = $('<li class="retweet" itemid="'+data[i].retweeted_status.id_str+'"><div class="dogear"></div><img src="'+data[i].retweeted_status.user.profile_image_url+'" alt="" align="left" width="48" height="48" /><cite>'+data[i].retweeted_status.user.screen_name+'</cite><p>'+data[i].retweeted_status.text.linkify_tweet()+'</p></li>');
 //                    if(data[i].retweeted_status.favorited) {
 //                        tmp.addClass('favorite');
 //                    }
 //                } else {
 //                    tmp = $('<li itemid="'+data[i].id_str+'"><div class="dogear"></div><img src="'+data[i].user.profile_image_url+'" alt="" align="left" width="48" height="48" /><cite>'+data[i].user.screen_name+'</cite><p>'+data[i].text.linkify_tweet()+'</p></li>');
 //                    if(data[i].favorited) {
 //                        tmp.addClass('favorite');
 //                    }
 //                }
                
 //                results.append(tmp);
 //            }
 //        },
 //        error:function(req, status, error) {
 //            alert('error: '+status);
 //        }
 //    });
})