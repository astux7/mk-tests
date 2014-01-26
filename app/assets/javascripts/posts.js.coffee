# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->

 $('.down-vote').on 'click', (e) ->
   e.preventDefault()
   value_votedown = $(this)
   $.get $(this).data('vote'),
    error: (jqXHR, textStatus, errorThrown) ->
       console.log  "error"
      success: (data, textStatus, jqXHR) ->
       console.log ' success'
       $(value_votedown).children().text(parseInt($(value_votedown).children().text(),10)+1)

  $('.up-vote').on 'click', (e) ->
   e.preventDefault()
   value_voteup = $(this)
   $.get $(this).data('vote'),
    error: (jqXHR, textStatus, errorThrown) ->
       console.log  "error"
      success: (data, textStatus, jqXHR) ->
       console.log ' success'
       $(value_voteup).children().text(parseInt($(value_voteup).children().text(),10)+1);



 