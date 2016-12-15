jQuery ->
  $(window).scroll ->
    url = $('#pagination .pagination .next_page').attr('href')
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 500
      $.getScript(url)
