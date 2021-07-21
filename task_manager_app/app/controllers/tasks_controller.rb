class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :show]

  respond_to :html, :json

  def index
    # Need to chnage this while adding devise authentication
      curren_user = User.first
    # Need to chnage this while adding devise authentication
    @tasks = Task.order(created_at: :desc).where(user_id: curren_user.id).limit(21)
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
    @task = Task.create(task_params)
    respond_modal_with @task, location: tasks_path
  end

  def show
    respond_modal_with @task
  end

  def start
    byebug
    # @task.start!
    # respond_modal_with @task, location: tasks_path
  end

  def complete
    byebug
    @task.complete!
  end


  def destroy
    @task.destroy
    redirect_to tasks_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :body, :start_date, :end_date).merge(user_id: User.first.id)
    end
end
