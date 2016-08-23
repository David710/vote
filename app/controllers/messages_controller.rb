class MessagesController < ApplicationController

  def index
    @header = Header.find_by_id(1)
  end

  def affichage

  end

end
