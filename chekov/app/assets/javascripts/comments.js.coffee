
$ ->
    $("a.add-comment").on "click", ->
        if $("#new-comment").length
            $("#new-comment").remove()
        taskid = $(this).data "taskId"
        commenterId = $(this).data "commenterId"
        $.get "/comments/new",
            task_id: taskid,
            commenter_id: commenterId
            , (data) ->
                $("body").append(data).removeClass('hidden')
                $("#new-comment").show().focus()

    # logic for cancel button:
    $(document).on "click", "#add-comment-cancel", (e) -> $("#new-comment").remove()