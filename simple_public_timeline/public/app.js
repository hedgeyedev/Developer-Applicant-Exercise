window.App = Ember.Application.create({
    ready: function () {
      this.timelineController.load();
      this.timelineView.appendTo('.content');
    }
});

App.timelineController = Ember.ArrayController.create({
    content: null,
    load: function () {
      self = this;
      $.ajax({
        type: 'GET',
        url: 'http://twitter.com/statuses/public_timeline.json',
        dataType: 'jsonp',
        crossDomain: true,
        success: function(data){
          self.set('content', data)
        },
        failure: function(){

        }
      });
    }
});

App.timelineView = Ember.View.create({
    templateName: 'timeline'
});

App.tweetView = Ember.View.extend({
  content: null,

  screen_name_link: function(){
      return "http://twitter.com/" + this.content.user.screen_name
  }.property(),

  created_at: function(){
      return new Date(this.content.created_at);
  }.property()
});



