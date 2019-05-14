class TasksController < ApplicationController

def index
 @tasks = Task.all
end

def show
  @task = Task.find(params[:id])
end

def new
  @task = Task.new
end

def create
 @created_task = Task.new(task_params)
 @created_task.save
 redirect_to tasks_path
end

def edit
 @edit_task = Task.find(params[:id])
end

def task_params
 params.require(:task).permit(:title, :details)
end

end

