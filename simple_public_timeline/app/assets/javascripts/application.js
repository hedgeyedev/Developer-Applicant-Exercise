// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap

$.ajax({
    type:'GET',
    url:'https://api.twitter.com/1/statuses/public_timeline.json',
    success:function(data) {
        var template =  '<div class="tweet"> <div class="row-fluid"> <div class="span12"> <div class="avatar pull-left"><img src="{{image}}"></div> <div class="content pull-left">{{text}}</div> </div> </div> <div class="row-fluid"> <div class="meta-data"><a href="https://twitter.com/{{name}}">{{user-name}}</a> on {{created}} via {{source}}</div> </div> </div>'

        for (var i = 0; i < data.length; i++){
          $("#tweets").append(template. replace('{{name}}',data[i]['user']['screen_name']).
                                        replace('{{user-name}}',data[i]['user']['screen_name']).replace('{{image}}',data[i]['user']['profile_image_url']).
                                        replace('{{text}}',data[i]['text']).  replace('{{created}}',data[i]['created_at']).replace('{{source}}',data[i]['source']));
        }
        
    }
});
