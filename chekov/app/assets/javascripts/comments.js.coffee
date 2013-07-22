
$ ->
    $("a.add-comment").on "click", ->
        if $("#new-comment").length
            $("#new-comment").remove()
        taskid = $(this).data "taskId"
        $.get "/comments/new",
            task_id: taskid,
            # TODO: fix this hardcoded value!!!
            commenter_id: 2
            , (data) ->
                $("body").append(data).removeClass('hidden')
                $("#new-comment").show().focus()

    # logic for cancel button:
    $(document).on "click", "#add-comment-cancel", (e) -> $("#new-comment").remove()

    # logic for ok/submit button:
###    $(document).on "click", "#add-comment-submit", (e) ->
        $.post "/comments",
            task_id: $("#comment-taskid").val(),
            commenter_id: $("#comment-commenter").val(),
            status_id: $("#comment-status").val(),
            description: $("#comment-description").val()
            , (data) ->
                console.log "data: %o", data
                $("#new-comment").remove()###