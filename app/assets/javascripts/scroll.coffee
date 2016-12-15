jQuery ->
  $(window).scroll ->
    url = $('#pagination .pagination .next_page').attr('href')
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 100
      $('#pagination .pagination').html('loading...')
      $.getScript(url)
