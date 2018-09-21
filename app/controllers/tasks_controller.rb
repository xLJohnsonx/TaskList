require 'pry'
# TASKS = [
#   { id: 1,
#     description: 'do homework',
#     completion: 'September 18, 2018'},
#   { id: 2,
#    description: 'do reverse sentence',
#    completion: 'September 18, 2018'},
#   { id: 3,
#     description: 'call drama mama',
#     completion: 'September 18, 2018'},
#   { id: 4,
#     description: 'get grokking',
#     completion: 'September 18, 2018'}]

class TasksController < ApplicationController
  before_action :get_task, only: [:edit, :update, :destroy, :complete, :incomplete]
  def index
    @tasks = Task.all
  end

  def get_task
    @task = Task.find(params[:id].to_i)
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)
    if @task.nil?
      render :notfound, status: :not_found
    end
  end

  def create
    @task = Task.new(item: params[:task][:item],
                     description: params[:task][:description],
                     due_date: params[:task][:due_date],
                     completion_date: nil)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def edit
    # @task = Task.find(params[:id].to_i)
  end

  def update
    # @task = Task.find(params[:id].to_i)
    # raise params.inspect
    if @task.update(item: params[:task][:item],
                    description: params[:task][:description],
                    due_date: params[:task][:due_date],
                    completion_date: params[:task][:completion_date])
      redirect_to task_path
    else
      render :new
    end
  end

  def destroy
    # @task = Task.find(params[:id].to_i)
    @task.destroy
    redirect_to root_path
  end

  def complete
    # raise
    @task.update(completion_date: DateTime.now)

    redirect_to task_path
  end

  def incomplete
    @task.update(completion_date: nil)
    redirect_to task_path
  end

end
