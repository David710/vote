# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AvisChannel < ApplicationCable::Channel
  def subscribed
    stream_from "avis"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if Message.exists?(text: data['message'])
      updated_message = Message.find_by(text: data['message'])
      updated_message.size = updated_message.size + 1
      updated_message.save
    else
      message = Message.create(text: data['message'], size: 1)
      #ActionCable.server.broadcast 'avis', message: message.text
    end

    @messages = Message.all
    puts @messages
    list_message = []
    @messages.each_with_index  do |message, index|
      text_message = message.text
      size_message = message.size
      hash_message = {text: text_message, size: size_message}
      puts hash_message
      list_message << hash_message
    end
      puts list_message
      puts list_message.class

      ActionCable.server.broadcast 'avis', message: list_message.as_json ,
      last_message: data['message']
  end
end
