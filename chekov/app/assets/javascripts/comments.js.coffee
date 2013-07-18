
$ ->
    $("a.add-comment").on "click", ->
        $('body').append "<div id='box'></div>"
        $.get "/comments/new", 
            task_id: 10,
            commenter_id: 2
            , (data) -> 
                $("#box").replaceWith(data).removeClass('hidden')
                $("#new-comment").show()