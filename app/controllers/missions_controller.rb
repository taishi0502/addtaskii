class MissionsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @missions = Mission.all.order(created_at: :desc)
    @task = Task.new
  end

  def new
    @mission = Mission.new
  end

  def create
    mission = Mission.new(mission_params)
    if mission.save
      flash[:success] = "更に課題についてのtaskをaddしましょう！"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @mission = Mission.find(params[:id])
    @task = Task.new
    @tasks = @mission.tasks
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    if @mission.update(mission_params)
      redirect_to root_path
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
    @missions = Mission.search(params[:keyword])
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy

    redirect_to root_path
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
