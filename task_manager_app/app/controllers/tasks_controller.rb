class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:edit, :update, :destroy, :show]
  before_action :set_selected_task, only: [:start, :complete, :pausing]

  respond_to :html, :json

  def index
    @tasks = Task.order(created_at: :desc).where(user_id: current_user.id).limit(21)
  end

  def new
    @task = Task.new
    respond_modal_with @task
  end

  def edit  
    respond_modal_with @task
  end

  def update
    @task.update(task_params)
    respond_modal_with @task, location: tasks_path  
  end

  def create
    if params['comment'].present? 
      comment = Comment.create(body: params['comment']['comment'], user_id:  current_user.id, task_id: params['comment']['task_id'])
      respond_modal_with comment.task, location: tasks_path

    else
      @task = Task.create(task_params)
      respond_modal_with @task, location: tasks_path
    end
  end

  def show
    @comments = Comment.where(task_id: @task.id, user_id: current_user.id)
    respond_modal_with @task
  end

  def start
    @current_task.start!
    redirect_to tasks_url
  end

  def complete
    @current_task.complete!
    redirect_to tasks_url
  end

  def pausing
    @current_task.pausing!
    redirect_to tasks_url
  end
  
  def destroy
    @task.destroy   
    redirect_to tasks_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      if params['comment'].present?
        @comment = Comment.find(params['id'])
      else
        @task = Task.find(params[:id])
      end
    end

    def set_selected_task
      @current_task = Task.find(params[:task_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name,:code, :body, :start_date, :end_date).merge(user_id: current_user.id)
    end
end
