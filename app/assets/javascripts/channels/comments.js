App.comments = App.cable.subscriptions.create('CommentsChannel', {
  received: function(data) {
    $("#comments").removeClass('hidden')
    return $('#comments').append(data);
  }
  // renderMessage: function(data) {
  //   return 
  //   // return "<p><b>" + data.image + ": </b>" + data.user + "</p><p>"+data.body+"</p>";
  // }
});
