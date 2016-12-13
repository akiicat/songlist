// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require sweetalert.min
function searching() {
  $('#songs_search[data-search-turbolinks=true]').attr('data-search-turbolinks', false).children('input').keyup(function() {
    $.get($("#songs_search").attr("action"), $("#songs_search").serialize(), null, "script");
    return false;
  });
}

$(document).on('ready turbolinks:load', searching);

//Override the default confirm dialog by rails
$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}
//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}
//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
  var message = link.data("confirm");
  swal({
    title: "你確定嗎？",
    text: message,
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: "#DD6B55",
    confirmButtonText: "沒錯！就這樣辦！",
    cancelButtonText: "取消",
    closeOnConfirm: false,
    closeOnCancel: true,
    showLoaderOnConfirm: true,
    allowOutsideClick: true
  },
  function(isConfirm){
    if (isConfirm) {
      $.rails.confirmed(link);
    } else {
    }
  });
}
