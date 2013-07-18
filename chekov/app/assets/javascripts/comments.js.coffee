
$ ->
    $("a.add-comment").on "click", ->
        if $("#new-comment").length
            $("#new-comment").remove()
        $('body').append "<div id='box'></div>"
        taskid = $(this).data "taskId"
        $.get "/comments/new", 
            task_id: taskid,
            commenter_id: 2
            , (data) -> 
                $("#box").replaceWith(data).removeClass('hidden')
                $("#new-comment").show()