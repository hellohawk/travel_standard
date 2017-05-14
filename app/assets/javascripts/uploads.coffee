$ ->
  $("#regions_div").click  (e)->
    $.ajax
      url:  'uploads/search'
      type: 'GET'
      data: {
        word: $(this).val()
      }
    return
  return
