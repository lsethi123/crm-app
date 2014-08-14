window.onload = ->
  $(".procpectCard").droppable()
  $(".stageRow ").sortable
    stop: (event, ui) ->
      cardId = +$(ui.item).data("stageId")
      columnId = +$(ui.item).parent().data("stageId")
      userId = +$("#userId").val()
      id = +$(ui.item).data("id")
      $(ui.item).data "stageId", columnId
      if +$(ui.item).parent().data("dropZone") is 1
        $.ajax
          url: "/ajax/drop"
          type: "POST"
          dataType: "js"
          data:
            id: id
            user_id: userId

        $(ui.item).fadeOut()
      else
        $.ajax
          url: "/ajax/stage"
          type: "POST"
          dataType: "js"
          data:
            id: id
            stage_id: columnId

      return

    connectWith: ".stageRow"

  $(".placeable").each (index, element) ->
    element_stage = +$(element).data("stageId")
    prospect_card = element
    $(".stageRow").each (index, element) ->
      stage = +$(element).data("stageId")
      $(prospect_card).appendTo $(element)  if stage is element_stage
      return

    return

  return
