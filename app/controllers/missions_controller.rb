class MissionsController < ApplicationController
  def index

     
     @missions = Mission.all
     @task = Task.new

  end


  def new
   @mission = Mission.new

   
  end

  def create
    
    mission = Mission.create(mission_params)
   
    if mission.save
      
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

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
    redirect_to root_path
  end


  private
  def mission_params
    params.require(:mission).permit(:mission, :startdate, :limitdate)
  end
 
  def get_mission
    @mission = Mission.find(params[:id])
  end
 
end
