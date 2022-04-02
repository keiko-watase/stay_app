class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find_by(id: current_user.id)
    @resavation = Resavation.new
    @resavation.room_id = @room.id
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room)
      flash[:notice] = "Room was successfully created."
    else
      render "new"
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
  end

  def search
    @area = params[:area]
    @key = params[:key]
    if @area != nil 
     @rooms = Room.search(params[:area])
    elsif @key != nil 
     @rooms = Room.search(params[:key])
    else
     @rooms = Room.all
    end
  end

  private
  def room_params
    params.require(:room).permit(:roomname, :roomintroduction, :fee, :adress, :room_image_id).merge(user_id: current_user.id)
  end
end
