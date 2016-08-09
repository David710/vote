App.avis = App.cable.subscriptions.create "AvisChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    $(document).on 'keypress', '#message', (event) =>
      if event.keyCode is 13
        @speak(event.target.value)
        event.target.value = ""
        event.preventDefault()

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').append(data.message)

  speak: (message) ->
    @perform 'speak', {message: message}
