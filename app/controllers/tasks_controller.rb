class TasksController < ApplicationController
  
  def index
    @tasks = Task.where(user_id: session[:user_id])
  end
  def show
    @task = Task.find(params[:id])
  end
  def new
    @task = Task.new
  end
  def create
    @task = Task.where(user_id: session[:user_id]).new(task_params)
    if @task.save
      redirect_to tasks_path
      else
        render :new, status: :unprocessable_entity
        end
end
def edit
  @task = Task.find(params[:id])
end

def update
  @task =Task.find(params[:id])

  if @task.update(task_params)
    redirect_to @task
  else
    render :edit, status: :unprocessable_entity
  end
end
def destroy
  @task = Task.find(params[:id])
  @task.destroy

  redirect_to root_path, status: :see_other
end
private
def task_params
  params.require(:task).permit(:title, :description, :status)

end
end
