class TasksController < ApplicationController
  before_action :require_user, only: [:index, :show]

  helper_method :resource_task

  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
  end

  def create
    @task = current_user.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task created!' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if resource_task.update(task_params)
        format.html { redirect_to tasks_path, notice: 'Update completed' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    resource_task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: 'Task destroyed!' }
    end
  end

  protected

  def resource_task
    @task = params[:id].present? ? Task.find(params[:id]) : Task.new
  end

  def task_params
    params.require(:task).permit(:title, :completed, :due_date, :description)
  end

end