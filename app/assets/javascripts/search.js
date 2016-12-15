function searching() {
  $('#songs_search').on('keyup', '#search', function() {
    $.get($("#songs_search").attr("action"), $("#songs_search").serialize(), null, "script");
    return false;
  });
  var input = $('#search');
  input.focus().val(input.val());
}

$(document).ready(searching);
