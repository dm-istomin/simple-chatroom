$(document).ready(function() {
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
      $chatbox.replaceWith(response);
    })
  });
});
