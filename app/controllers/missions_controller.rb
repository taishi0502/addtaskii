class MissionsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @missions = Mission.all.order(created_at: :desc)
    @task = Task.new
    @name = current_user&.name
    @mylevel = current_user&.level
    @userid = current_user&.id
    @room = Room.find_by(params[:id])
  end

  def new
    @mission = Mission.new
    @name = current_user&.name
    @mylevel = current_user&.level
    @userid = current_user&.id
  end

  def create
    @user = User.find(current_user.id)
    @mission = Mission.new(mission_params)
    if @mission.save
      redirect_to user_path(@user)
    else
      redirect_to new_mission_path
    end
  end

  def show
    @name = current_user&.name
    @mylevel = current_user&.level
    @userid = current_user&.id
    @mission = Mission.find(params[:id])
    @task = Task.new
    @tasks = @mission.tasks
  end

  def edit
    @mission = Mission.find(params[:id])
    @name = current_user&.name
    @mylevel = current_user&.level
    @userid = current_user&.id
  end

  def update
    @user = User.find(current_user.id)
    @mission = Mission.find(params[:id])
    if @mission.update(mission_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def levelup
    @user = current_user
    @level = @user.increment(:level, 1)
    @level.save

    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to root_path
  end

  def search
    @name = current_user&.name
    @mylevel = current_user&.level
    @userid = current_user&.id
    @task = Task.new
    if @missions = Mission.search(params[:keyword])
        
    else
        render root_path
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @mission = Mission.find(params[:id])
    @mission.destroy

    redirect_to user_path(@user)
  end

  private

  def mission_params
    params.require(:mission).permit(:mission, :startdate, :limitdate).merge(user_id: current_user.id)
  end

  def get_mission
    @mission = Mission.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def levelup_parmas
    params.require(:user).permit(:level).merge(mission_id: mission.id)
  end


end
