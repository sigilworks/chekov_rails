
$ ->
    # control the styling behavior of certain buttons
    # TODO: fix whatever this was supposed to be doing...
    $(".chekov-button").on
        mousedown: (e) -> $(e.target).addClass "button-click-state"
        mouseup: (e) -> $(e.target).removeClass "button-click-state"

    # when user chooses to filter table, route accordingly when <option> selected...
    $("#filter-list").on "change", (e) -> location.href = "/?filter=#{$(this).val()}"

    # toggle back and forth--on click--between right-facing and downward-facing
    # expander arrows, showing/hiding comments associated with that task...
    $(".arrow-right, .arrow-down").on "click", (e) ->
        $(this).toggleClass("arrow-right arrow-down")
               .parents("tr").find(".comments-display").toggle()

    $(".id-cell, .comments-display .meta").on "mouseenter mouseleave", (e) ->
        $(this).find(".icon-hidden, .icon-visible").toggleClass("icon-hidden icon-visible")

    # hide flash messages when the "X" is clicked...
    $(".flash .X").on "click", -> clearMessages $(this).parent()