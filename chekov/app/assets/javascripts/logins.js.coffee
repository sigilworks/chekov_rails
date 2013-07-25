
$ ->

    $("#user-login-list").on "change", (e) ->
      selected = $(e.target).val()
      $.get "logins/create",
        username: selected
        , () ->
          # TODO: temporary refresh, replace this!
          window.location.reload()