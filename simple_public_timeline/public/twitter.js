$.getJSON("/twitter_json", function( data ) {
  $.each( data, function( i, item ) {
    var html = '<article> \
                  <img src="'+item.profile_image_url+'"> \
                  <div> \
                    <span class="author"><a href="https://twitter.com/'+item.screen_name+'">'+item.screen_name+'</a></span> \
                    '+item.text+' \
                    <span class="info">'+item.created_at+' via '+item.source+'</span> \
                  </div> \
                </article>';
    $("#status_updates").append(html);
  });
});
