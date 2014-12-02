$(document).ready(function() {

  setInterval(function() {
    updateChat();
  }, 1000)

  var $target = $(event.target);
  var $chatbox = $('#chatbox');

  function updateChat() {
    $.ajax({
      url: '/',
      method: "GET"
    }).done(function(response) {
      $chatbox.html(response);
    })
  }

  $('#user-input').submit(function(event) {
    event.preventDefault();
    var $target = $(event.target);
    var $chatbox = $('#chatbox');

    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize()
    }).done(function(response) {
      $target.find('textarea').val('');
      $chatbox.html(response);
    })
  });
});
