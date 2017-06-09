class MessagesController < ApplicationController

  def index
    @header = Header.find_by_id(1)
  end

  def affichage
    @messages = Message.all
    @list_message = []
    @messages.each_with_index  do |message, index|
      text_message = message.text
      size_message = message.size
      hash_message = {text: text_message, size: size_message}
      @list_message << hash_message
    end
  end

end
