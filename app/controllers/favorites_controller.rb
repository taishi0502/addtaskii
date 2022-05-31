class FavoritesController < ApplicationController

  def create

    mission = Mission.find(params[:mission_id])
    favorite = current_user.favorites.new(mission_id: mission.id)
    favorite.save
    redirect_to missions_path
  end
  
  def destroy

    mission = Mission.find(params[:mission_id])
    favorite = current_user.favorites.find_by(mission_id: mission.id)
    favorite.destroy
    redirect_to missions_path
  end
end
