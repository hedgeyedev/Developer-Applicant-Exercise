window.addEventListener("load", (event) => {
    let tweet;
    if (tweets) {
        let stream = document.getElementsByClassName('stream')[0];
        tweets.forEach(el => {
            tweet = "<img src='" + el.user.profile_image_url + "'>" +
                "<a href='" + el.user.url + "'>" + el.user.screen_name + "</a>" +
                el["text"] + "<br>" +
                el.source + "<br>" +
                el.created_at
            ;    
            let li = document.createElement('li');
            li.innerHTML = tweet;
            stream.appendChild(li);
        });
    }
  });