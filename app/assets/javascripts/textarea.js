function fit_textarea(){
  $('.content').on('change keyup keydown paste cut', 'textarea', function (){
    var scrollBottom = window.pageYOffset;
    if ($(this).height() < this.scrollHeight - 8) {
      $(this).height(0).height(this.scrollHeight + 28);
    }
    window.scrollTo(0, scrollBottom);
  }).find('textarea').change();
}

$(document).ready(fit_textarea);
