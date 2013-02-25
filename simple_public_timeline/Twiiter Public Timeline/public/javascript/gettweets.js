function get_tweets(){
		
	$.ajax({		
		url: "/get_tweets",
		//contentType: "application/json",			
		dataType: 'json',
		cache:false,
		crossDomain:false,
		success: function(results) {
			//loop results
			$.each(results, function(key){
				
				user_name = results[key].user_name;
				user_screen_name = results[key].user_screen_name;
				user_image = results[key].user_image;
				tweet = results[key].tweet;
				created_at = new Date(results[key].created_at);
				curent_time = new Date();
				tweet_time = timeDifference(curent_time, created_at);
				tweet_source = results[key].tweet_source;
							
				$(".twitter-stream").append('<p><img src="' + user_image + '" width=40 height=40 align=absmiddle> ' + tweet + '<br>Posted by: ' + '<a href="http://twitter.com/' + user_screen_name + '">' + user_name + '</a> ' + tweet_time + ', Via: ' + tweet_source + ' - ' +'</p>');
			})
		},
		error: function(error){
			alert(error.status);
			}
	})
}

function timeDifference(current, previous) {

    var msPerMinute = 60 * 1000;
    var msPerHour = msPerMinute * 60;
    var msPerDay = msPerHour * 24;
    var msPerMonth = msPerDay * 30;
    var msPerYear = msPerDay * 365;

    var elapsed = current - previous;

    if (elapsed < msPerMinute) {
         return Math.round(elapsed/1000) + ' seconds ago';   
    }

    else if (elapsed < msPerHour) {
         return Math.round(elapsed/msPerMinute) + ' minutes ago';   
    }

    else if (elapsed < msPerDay ) {
         return Math.round(elapsed/msPerHour ) + ' hours ago';   
    }

    else if (elapsed < msPerMonth) {
        return 'approximately ' + Math.round(elapsed/msPerDay) + ' days ago';   
    }

    else if (elapsed < msPerYear) {
        return 'approximately ' + Math.round(elapsed/msPerMonth) + ' months ago';   
    }

    else {
        return 'approximately ' + Math.round(elapsed/msPerYear ) + ' years ago';   
	}
}