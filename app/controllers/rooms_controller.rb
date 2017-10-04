class RoomsController < ApplicationController

  def show

    @index = params[:index]
    @room = Room.find(params[:id])
    @comment = Comment.new

    authorize! :read, @room
  end

end