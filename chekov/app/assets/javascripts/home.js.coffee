
$ ->
    # control the styling behavior of certain buttons
    # TODO: fix whatever this was supposed to be doing...
    $(".chekov-button").on
        mousedown: (e) -> $(e.target).addClass "button-click-state"
        mouseup: (e) -> $(e.target).removeClass "button-click-state"

    # when user chooses to filter table, route accordingly when <option> selected...
    $("#status-list").on "change", (e) -> location.href = "/?filter=#{$(this).val()}"

    # toggle back and forth--on click--between right-facing and downward-facing
    # expander arrows, showing/hiding comments associated with that task...
    $(".arrow-right, .arrow-down").on "click", (e) ->
        $(this).toggleClass("arrow-right arrow-down")
               .parents("tr").find(".comments-display").toggle()

    $(".id-cell, .comments-display .meta").on "mouseenter mouseleave", (e) ->
        $(this).find(".icon-hidden, .icon-visible").toggleClass("icon-hidden icon-visible")

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

    # hide flash messages when the "X" is clicked...
    $(".flash .X").on "click", -> $(this).parent().slideUp 500, -> $(this).remove()