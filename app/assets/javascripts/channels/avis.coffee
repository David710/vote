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

    $("#word-cloud").empty()

    drawCloud(data.message)
    color_word = @getColor()
    $("#word-alone").css("color" , color_word)
    $("#word-alone").html(data.last_message).fadeIn(1000).delay(2000).fadeOut(1000)
    $("#word-cloud").fadeOut(1000).delay(4000).fadeIn(1000)

  speak: (message) ->
    @perform 'speak', {message: message}

  getColor: () ->
    colors = ["red", "blue", "yellow", "green"]
    indice = Math.random() * 4
    indice_entier = Math.round(indice)
    console.log colors[indice_entier]
    return colors[indice_entier]
