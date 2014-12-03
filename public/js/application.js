var latestMessage = 0;

$(document).ready(function() {

  setInterval(function() {
    console.log(latestMessage)
    updateChat();
  }, 2000)

  var $chatbox = $('#chatbox');
  $chatbox.html('WAAAA');

  function updateChat() {

    $.ajax({
      url: '/message/latest/' + latestMessage,
      method: "GET",
      dataType: "JSON"
    }).done(function(response) {
      // console.log(response);
      if ($.isEmptyObject(response) != true) {
        $chatbox.append(response.content);
        latestMessage = parseInt(response.latest_id);
      };
    })
  }

  $('#user-input').submit(function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      url: $target.attr('action'),
      method: $target.attr('method'),
      data: $target.serialize()
    })
  });
});
