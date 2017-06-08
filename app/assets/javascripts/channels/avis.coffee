App.avis = App.cable.subscriptions.create "AvisChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    $(document).on 'keypress', '#message', (event) =>
      if event.keyCode is 13
        @validations(event.target.value)
        @speak(event.target.value)
        event.target.value = ""
        event.preventDefault()

    $( "div #okbutton" ).on 'click', (event) =>
      $message = $('#message').val()
      @validations($message)
      @speak($message)
      $message = ""


  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    $("#word-cloud").empty()

    drawCloud(data.message)
    color_word = @getColor()
    $("#word-alone").css("color" , color_word)
    snd = new Audio('/assets/ooweep.mp3')
    snd.play()
    $("#word-alone").html(data.last_message).fadeIn(1000).delay(1000).fadeOut(1000)
    #$("#word-cloud").fadeOut(1000).delay(3000).fadeIn(1000)
    $("#word-cloud").delay(1000).fadeIn(1000)

  speak: (message) ->
    @perform 'speak', {message: message}

  getColor: () ->
    colors = ["red", "blue", "yellow", "green"]
    indice = Math.random() * 4
    indice_entier = Math.round(indice)
    return colors[indice_entier]

  validations: (text) ->
    console.log text
    $("#error_message").empty()
    if text == ""
      $("#error_message").html("entrez un message non vide")
    else
      if text.length > 30
        $("#error_message").html("pas plus de 30 caractères")
      else
        true
