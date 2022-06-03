class UsersController < ApplicationController
  def show
    @name = current_user.name
    @missions = current_user.missions.order(created_at: :desc)
  end

end
