class ResavationsController < ApplicationController
  def index
    @resavations = current_user.resavations.order(updated_at: 'DESC')
  end


  def confirm
    @resavation = Resavation.new(resavation_params)
    @user = current_user.id
    @room = Room.find(params[:room_id])
    @resavation.room_id = @room.id
    if @resavation.invalid?
      render 'rooms/show'
    else
      fee = @room.fee
      resarver = @resavation.people_number
      days = (@resavation.end_at.to_date - @resavation.start_at.to_date).to_i
      @resavation.total_price = (days * resarver * fee)
      @resavation.total_day = days
    end
  end

  def back
    @user = current_user.id
    @room = Room.find(params[:resavation][:room_id])
		@resavation = Resavation.new(resavation_params)
		render 'rooms/show'
	end

  def create
    @user = current_user.id
    @resavation = Resavation.new(resarve_params)
    @room = Room.find(params[:resavation][:room_id])
    fee = @room.fee
    resarver = @resavation.people_number
    days = (@resavation.end_at.to_date - @resavation.start_at.to_date).to_i
    @resavation.total_price = (days * resarver * fee)
    @resavation.total_day = days
    if @resavation.save
      flash[:notice] = "Reservation was successfully created."
      redirect_to ("/resavations/#{@resavation.id}")
    else
      flash[:notice] = "予約できませんでした"
      render("rooms/new/#{params[:room_id]}")
    end
  end

  def show
    @resavation = Resavation.find(params[:id])
  end


  def resavation_params
    params.permit(:start_at, :room_id, :end_at, :people_number, :resavation_id).merge(user_id: current_user.id, room_id: @room_id)
   end
   
   def resarve_params
    params.require(:resavation).permit(:start_at, :room_id, :end_at, :people_number, :total_price, :total_day, :resavation_id).merge(user_id: current_user.id)
   end

end
