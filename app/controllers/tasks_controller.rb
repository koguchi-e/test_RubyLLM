class TasksController < ApplicationController
  before_action :set_situation
  before_action :set_task, only: %i[update destroy]

  def index
    @tasks = @situation.tasks.order(:position)
    @new_task = @situation.tasks.build
  end

  def create
    @new_task = @situation.tasks.build(task_params)
    @new_task.position = @situation.tasks.maximum(:position).to_i + 1
    if @new_task.save
      redirect_to situation_tasks_path(@situation), notice: "完了しました"
    else
      @tasks = @situation.tasks.order(:position)
      redirect_to situation_tasks_path(@situation), alert: "失敗しました"
    end
  end

  def update
    if @task.update(task_params)
      redirect_to situation_tasks_path(@situation), notice: "完了しました"
    else
      redirect_to situation_tasks_path(@situation), alert: "失敗しました"
    end
  end

  def destroy
    if @task.destroy!
      redirect_to situation_tasks_path(@situation), notice: "完了しました"
    else
      redirect_to situation_tasks_path(@situation), alert: "失敗しました"
    end
  end

  private

  def set_situation
    @situation = Situation.find(params[:situation_id])
  end

  def set_task
    @task = @situation.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content)
  end
end
