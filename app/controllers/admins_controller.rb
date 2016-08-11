class AdminsController < ApplicationController

  def index
  end

  def delete
    @messages = Message.all
    @messages.destroy_all
    render 'index'
  end

end
