class UsersController < ApplicationController
  def show
    @name = current_user.name
    @missions = current_user.missions

  end


end
