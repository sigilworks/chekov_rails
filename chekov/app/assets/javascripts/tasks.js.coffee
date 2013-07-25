
$ ->
    # ajax handling for clicking "(+) New Task" button
    $("#new-task-button").on "click", ->
        if $("#new-task").length
            $("#new-task").remove()
        reporterId = $(this).data "reporterId"
        $.get "/tasks/new",
            reporter_id: reporterId
            , (data) ->
                $("body").append(data).removeClass('hidden')
                $("#new-task").show().focus()

    # dealing with clicking on the X-icon to delete a particular task
    $(".delete-row").on "ajax:success", (event, status, xhr) ->
        $target = $(event.target)
        rowId = $target.data 'rowid'
        $row = $("#row_#{ rowId }")
        $row.remove()

    # logic for cancel button:
    $(document).on "click", "#add-task-cancel", (e) -> $("#new-task").remove()
    # cancel removes open comments window
    $(document).on "keyup", (e) ->
        if e.keyCode == 27 and $("#new-task").is ":visible"
            $("#new-task").remove()