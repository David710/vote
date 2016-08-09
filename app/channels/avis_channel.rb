# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AvisChannel < ApplicationCable::Channel
  def subscribed
    stream_from "avis"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create(text: data['message'])
    ActionCable.server.broadcast 'avis', message: message.text
  end
end
