function searching() {
  $('#songs_search').on('keyup', '#search', function() {
    var key_word = $('#search').val();
    history.pushState(null, null, '?search=' + key_word);
    document.cookie = 'search=' + key_word + '; path=/';

    $.get($("#songs_search").attr("action"), $("#songs_search").serialize(), null, "script");
    return false;
  });
  var input = $('#search');
  input.focus().val(input.val());
}

$(document).ready(searching);
