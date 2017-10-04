class BookingsController < ApplicationController

  def create
    authorize! :create, Booking
    @room =  Room.find(params[:room])
    if @room.bookings.create(user: current_user, room: @room)
      @room.update(is_free: false)
    end
    redirect_to inn_room_path(@room.inn, @room)
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize! :destroy, @booking
    if @booking.destroy
      @booking.room.update(is_free: true)
    end
    redirect_back(fallback_location: root_path)
  end

end