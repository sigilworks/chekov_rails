# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    # control the styling behavior of certain buttons
    $(document).on
        mousedown: (e) -> $(e.target).addClass "button-click-state" if $(e.target).hasClass "chekov-button"
        mouseup: (e) -> $(e.target).removeClass "button-click-state" if $(e.target).hasClass "chekov-button"

    # TODO: replace with location.href instead...
    # when user chooses to filter table, route accordingly when <option> selected...
    # $("#app-wrapper header select").change (e) ->
    # window.app.TaskRouter.navigate "filter/#{ $(this).val() }", trigger: true

    # TODO:
    # toggle back and forth--on click--between right-facing and
    # downward-facing expander arrows...
    # $(e.currentTarget).toggleClass('arrow-right').toggleClass('arrow-down');

    # isOpen = $(e.target).hasClass('arrow-right')
    # $parent_tr = $(e.target).parents('tr')
    # taskid = $parent_tr.data('taskid')

    # if !isOpen
    #     # pass CommentPresenter.new to a :partial
    # else
    #     # destroy the :partial