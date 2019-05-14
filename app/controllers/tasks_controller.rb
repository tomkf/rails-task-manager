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

def update
@edit_task = Task.find(params[:id])
 @edit_task.update(task_params)
 redirect_to tasks_path
 params[:task][:completed] == '1' ? @edit_task.update(completed: true) : @edit_task.update(completed: false)
end

def task_params
 params.require(:task).permit(:title, :details)
end

end

