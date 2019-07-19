class TasksController < ApplicationController
  before_action :require_user, only: [:index, :show]

  helper_method :resource_task

  def index
    @tasks = current_user.tasks
  end

  def show
  end

  protected

  def resource_task
    @task = Task.find(params[:id])
  end

end