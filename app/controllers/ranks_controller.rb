class RanksController < ApplicationController
  def index
    @name = current_user&.name
    @mylevel = current_user&.level
    @userid = current_user&.id

    @users = User.all
    @user = User.where(id: params[:id])
    @level = User.select(:level)
    @username = User.select(:name)
    @ranks = User.select(:id, :name, :level).order('level DESC')
  end
end
