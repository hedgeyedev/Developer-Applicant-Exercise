jQuery(function() {
  	return jQuery.ajax({
    	method: "GET",
    	url: "/get_tweets",
    	success: function(result) {
      		return $("#content").html(result);
    	}
  	});
});