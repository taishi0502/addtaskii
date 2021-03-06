class TasksController < ApplicationController
  def create
    @task = Task.create(task_params)
    if @task.save
      redirect_to mission_path(@task.mission)
      # render json:{ @task: task }
    else
      @mission = @task.mission
      @tasks = @mission.tasks

      redirect_to mission_path(@mission)
    end
  end

  private

  def task_params
    params.require(:task).permit(:task).merge(mission_id: params[:mission_id])
  end

  def get_mission
    @mission = Mission.find(params[:id])
  end
end
