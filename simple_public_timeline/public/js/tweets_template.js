var TweetTemplate = {
  tmpl: function() {
    return "<li id=\"status_{{id}} class=\"u-{{user.screen_name}} hentry status\">" +
              "<span class=\"thumb vcard author\">" + 
                "<a class=\"tweet-url profile-pic url\" href=\"{{user.url}}\">" +
                  "<img class=\"photo fn\" alt=\"{{user.name}}\" height=\"48\" width=\"48\" src=\"{{user.profile_image_url}}\" />" +
                "</a>" + 
              "</span>" + 
              "<span class=\"status-body\">" + 
                "<span class=\"status-content\">" + 
                  "<strong>" + 
                    "<a class=\"tweet-url screen-name\" href=\"{{user.url}}\">{{user.screen_name}}</a>" +
                  "</strong>" +
                  "<span class=\"entry-content\">{{{html_text}}}</span>" +
                "</span>" +
                "<span class=\"meta entry-meta\" data=\"{}\">" +
                  "<a class=\"entry-date\" rel=\"bookmark\" href=\"https://twitter.com/{{user.screen_name}}/status/{{id}}\">" +
                    "<span class=\"published timestamp\" title=\"{{created_at}}\" /> " +
                  "</a>" +
                  "<span>via {{{source}}}</span>" +
                "</span>" +
              "<ul class=\"meta-data clearfix\" />" +
            "</li>";
  },
  compiled: function(options) {
    return Handlebars.compile(this.tmpl())(options);
  }
}
