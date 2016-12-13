function clippy() {
  $('[data-clippy-turbolinks=true]').attr('data-clippy-turbolinks', false).click(function(e) {
    e.preventDefault();
    var song_name = $(this).data('clippy');
    copyTextToClipboard(song_name);
  });
}

function copyTextToClipboard(text) {
  var textArea = document.createElement("textarea");

  textArea.value = text;

  document.body.appendChild(textArea);

  textArea.select();

  try {
    var successful = document.execCommand('copy');
    // var msg = successful ? 'successful' : 'unsuccessful';
    // console.log('Copying text command was ' + msg);
  } catch (err) {
    console.log('Oops, unable to copy');
  }

  document.body.removeChild(textArea);
}

$(document).on('ready turbolinks:load', clippy);
