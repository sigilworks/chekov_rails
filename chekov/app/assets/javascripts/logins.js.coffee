
$ ->
    # control the styling behavior of certain buttons
    # TODO: fix whatever this was supposed to be doing...
    $("#user-login-list").on "change", (e) ->
      selected = $(e.target).val()
      $.get "logins/create",
        username: selected
        , () ->
          # TODO: temporary refresh, replace this!
          window.location.reload()