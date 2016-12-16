jQuery ->
  $(window).scroll ->
    url = $('#pagination .pagination .next_page').attr('href')
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 100
      $('#pagination').html('<div id="hold"></div><div style="height: 200px"></div>')
      preloader()
      $.getScript(url)
