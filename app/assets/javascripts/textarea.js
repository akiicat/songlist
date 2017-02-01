function fit_textarea(){
  $('.content').on( 'change keyup keydown paste cut', 'textarea', function (){
    var scrollBottom = window.pageYOffset;
    $(this).height(0).height(this.scrollHeight);
    window.scrollTo(0, scrollBottom);
  }).find( 'textarea' ).change();
}

$(document).ready(fit_textarea);
