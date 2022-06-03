class UsersController < ApplicationController
  def show
    @missions = current_user.missions.order(created_at: :desc)
    @name = current_user&.name
    @level = current_user&.level
    @userid = current_user&.id
  end

end
