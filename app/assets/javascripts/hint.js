function hint() {
  var flag = false;
  function title(){
    return flag ? $(this).attr('data-aria-label') : $(this).attr('data-tipsy-hint');
  };

  $('[data-aria-label]')
    .on('mouseover',function(){
      flag = true;
      $(this).tipsy("show");
    })
    .on("click",function() {
      flag = false;
      $(this).tipsy("show");
    })
    .tipsy({
      gravity: 'n',
      html: true,
      title: title,
      opacity: 1,
      delayIn: 0,
      delayOut: 0
    });
}

$(document).ready(hint);
