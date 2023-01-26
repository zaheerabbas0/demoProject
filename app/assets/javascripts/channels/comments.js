App.comments = App.cable.subscriptions.create('CommentsChannel', {
  received: function(data) {
    return $('#comments').append(data['comment']);
  
  }
});
