# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# 地方と都道府県の連動フォーム

$(document).on 'change', '#card_region_id', ->
    $.ajax(
      type: 'GET'
      url: '/cards/:id/get_prefectures'
      data: {
        region_id: $(this).val()
      }
    ).done (data) ->
      $('.prefecture-area').html(data)

$('#edit_modal').on("ajax:success", (e, data, status, xhr) ->
    # フラッシュメッセージ付きでリダイレクトするだけなので、success時はココでは何もしない
  ).on "ajax:error", (e, xhr, status, error) ->
    message = xhr.responseText
    $('#error-message').html(message)