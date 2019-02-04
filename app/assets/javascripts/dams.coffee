# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#dam_region_id', ->
    $.ajax(
      type: 'GET'
      url: '/dams/get_prefectures'
      data: {
        region_id: $(this).val()
      }
    ).done (data) ->
      $('.prefecture-area-dam').html(data)