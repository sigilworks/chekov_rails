
$ ->
    # ajax handling for clicking "(+) New Task" button
    $("#new-task-button").find("button").on "click", ->
        if $("#new-task").length
            $("#new-task").remove()
        reporterId = $("#new-task-button").data "reporterId"
        $.get "/tasks/new",
            reporter_id: reporterId
            , (data) ->
                $("body").append(data).removeClass('hidden')
                $("#new-task").show().focus()
        # clear any flash messages remaining
        clearMessages()

    # TODO: DRY this and ^^ out!!
    # ajax handling of clicking Edit Comment icon
    $("#task-table").on "click", "a.edit-row", ->
        if $("#new-task").length
            $("#new-task").remove()
        taskId = $(this).data "taskId"
        $.get "/tasks/#{ taskId }/edit",
            (data) ->
                $("body").append(data).removeClass('hidden')
                $("#new-task").show().focus()
        # clear any flash messages remaining
        clearMessages()


    $(document).on "click", "#add-task-submit", ->
        reporterId = $(this).data "reporterId"
        $.post "/tasks",
            application_id: $("#add-application").val(),
            build_observed: $("#new-build").val(),
            status_id: $("#task_status_id").val(),
            browser_id: $("#new-browser").val(),
            bz_id: $("#new-bzId").val(),
            reporter_id: $("#new-reporter").val(),
            description: $("#new-description").val()
            , (data) ->
                $("#new-task").remove()
                $("#task-table").find("tbody").prepend(data);
                # clear any flash messages remaining
                clearMessages()
                successMessage("Task added successfully!");


    $(document).on "click", "#edit-task-submit", ->
        taskId = $(this).data "taskId"
        $.ajax
            type: "PUT",
            url: "/tasks/#{ taskId }",
            data:
                application_id: $("#add-application").val(),
                build_observed: $("#new-build").val(),
                status_id: $("#task_status_id").val(),
                browser_id: $("#new-browser").val(),
                assignee_id: $("#task-assignee").val(),
                bz_id: $("#new-bzId").val(),
                reporter_id: $("#new-reporter").val(),
                description: $("#new-description").val()
            success: (data) ->
                $("#new-task").remove()
                $("#task-table").find("tbody").prepend data
                # clear any flash messages remaining
                clearMessages()
                successMessage "Task updated successfully!"


    # dealing with clicking on the X-icon to delete a particular task
    $(".delete-row").on "ajax:success", (event, status, xhr) ->
        $target = $(event.target)
        rowId = $target.data 'rowid'
        $row = $("#row_#{ rowId }")
        $row.remove()
        # clear any flash messages remaining
        clearMessages()

    # logic for cancel button:
    $(document).on "click", "#add-task-cancel, #edit-task-cancel", (e) -> $("#new-task").remove()
    # cancel removes open comments window
    $(document).on "keyup", (e) ->
        if e.keyCode == 27 and $("#new-task").is ":visible"
            $("#new-task").remove()