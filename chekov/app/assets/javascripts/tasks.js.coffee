
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

    # logic for ok/submit button:
    $(document).on "click", "#add-task-submit", (e) ->
        $.post "/tasks",
            application_id: $("#new-application").val(),
            assignee_id: $("#new-assignee").val(),
            build_observed: $("#new-build").val(),
            reporter_id: $("#new-reporter").val(),
            bz_id: $("#new-bzId").val(),
            browser_id: $("#new-browser").val(),
            status_id: 3, # NEW 
            description: $("#new-description").val()
            , (data) ->
                console.log "data: %o", data
                $("#new-task").remove()

    $("a.delete-row").on "click", (e) ->
        e.preventDefault()
        id = $(this).data "rowid"
        $.ajax "/tasks/#{ id }",
            type: "DELETE"
            , (data) ->
                console.log "#row_#{ id }"
                $("#row_#{ id }").remove()
                true
