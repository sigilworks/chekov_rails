
$ ->
    $("#new-task-button").on "click", ->
        if $("#new-task").length
            $("#new-task").remove()
        taskid = $(this).data "taskId"
        $.get "/tasks/new",
            task_id: taskid,
            # TODO: fix this hardcoded value!!!
            reporter_id: 2
            , (data) ->
                $("body").append(data).removeClass('hidden')
                $("#new-task").show().focus()

    # logic for cancel button:
    $(document).on "click", "#add-task-cancel", (e) -> $("#new-task").remove()