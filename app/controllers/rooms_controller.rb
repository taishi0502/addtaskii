class RoomsController < ApplicationController
  def index
    
  end
  def new
     @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end 
     
   end
   
   def join
    @room = Room.find_by(id: params[:id])
    
    if !@room.current_user.Include?
        @room.users << current_user.id
        redirect_to root_path
    else
        redirect_to join_room_path
    end
   end

   private
   def room_params
     params.require(:room).permit(:room_name, user_ids: [])
   end
  #  def join_params
  #   params.require(:room).permit(:room_name)
  #  end

end
