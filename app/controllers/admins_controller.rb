class AdminsController < ApplicationController

  def index
  end

  def delete
    @messages = Message.all
    @messages.destroy_all
    render 'index'
  end

  def update
    @header = Header.find_by_id(1)
    @header.update(header_params)
    redirect_to root_path
  end

  private
      def header_params
        params.require(:header).permit(:title)
      end

end
