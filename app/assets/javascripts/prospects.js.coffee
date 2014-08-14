# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.onload = ->
  $(".procpectCard").droppable()
  $(".stageRow").sortable({connectWith: ".stageRow"})
  $(".placeable").each (index, element) ->
    element_stage = undefined
    prospect_card = undefined
    element_stage = +$(element).data("stageId")
    prospect_card = element
    $(".stageRow").each (index, element) ->
      stage = undefined
      stage = +$(element).data("stageId")
      $(prospect_card).appendTo $(element)  if stage is element_stage
      return

    return

  return
