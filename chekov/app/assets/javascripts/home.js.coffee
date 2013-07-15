# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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
               .parents("tr").find(".comments-display").toggle();