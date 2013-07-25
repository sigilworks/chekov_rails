
$ ->
    # ajax handling of clicking (+) to add new comments
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

    # dealing with clicking on the X-icon to delete a particular comment...
    $(".delete-comment").on "ajax:success", (event, status, xhr) ->
        $target = $(event.target)
        commentId = $target.data 'commentId'
        taskId = $target.data 'taskId'
        $li = $("li[data-comment-id=#{commentId}]")
        $row = $("#row_#{ taskId }")
        # remove the <li>
        $li.remove()
        $indices = $row.find(".comment-tag")
        if $indices.length
            # re-number the remaining comments, so as not to have any "holes" in their index
            $.each($indices, (newIndex, tag) -> $(tag).html(++newIndex))
            $row.find(".comments-count").html (i, oldval) -> +oldval - 1
            $row.find("h3").html (i, oldval) ->
                cnt = +oldval.split(' ')[0]
                "#{ --cnt } comments"
        else
            # if no remaining comments remain, delete the comments container and the talk bubble
            $row.find(".comments-display").remove()
            $row.find(".comments-count").remove()
            $row.find(".arrow-down").remove()

    # logic for cancel button:
    $(document).on "click", "#add-comment-cancel", (e) -> $("#new-comment").remove()
    # cancel removes open comments window
    $(document).on "keyup", (e) ->
        if e.keyCode == 27 and $("#new-comment").is ":visible"
            $("#new-comment").remove()