class InnsController < ApplicationController

  before_action :set_inn

  def index
    @inns = Inn.joins(:rooms).where(rooms: { is_free: true }).group('rooms.inn_id').order("count(rooms.inn_id) desc")
  end

  def show
    authorize! :read, @inn
    @rooms = @inn.rooms.order(is_free: :desc)
  end

  def new
    @inn = Inn.new
    authorize! :create, @inn
  end

  def create
    @inn = Inn.new(inn_params)
    authorize! :create, @inn
    if @inn.save
      redirect_to inn_path(@inn)
    else
      render :new
    end
  end

  def edit
    authorize! :update, @inn
  end

  def update
    authorize! :update, @inn
    if @inn.update(inn_params)
      redirect_to inn_path(@inn)
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @inn
    @inn.destroy
    redirect_to inns_path
  end

  private

  def inn_params
    params.require(:inn).permit(:name, :image, :room_count)
  end

  def set_inn
    @inn = Inn.find(params[:id]) if params[:id]
  end

end
