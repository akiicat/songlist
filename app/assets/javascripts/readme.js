function readme() {
  $('#readme').click(function(e){
    var message = $('#doc').clone().removeClass().html();
    swal({
      title: "說明",
      html: message,
      width: '75%',
      confirmButtonColor: "#4078c0",
      confirmButtonText: "知道了",
      showLoaderOnConfirm: true,
      allowOutsideClick: true,
      showCloseButton: true
    }).then(function() {
    }, function(dismiss) {
      // dismiss can be 'overlay', 'cancel', 'close', 'esc', 'timer'
    });
  });
}

$(document).ready(readme);
