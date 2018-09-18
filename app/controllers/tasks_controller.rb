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
  def index
    @tasks = Task.all
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)
    if @task.nil?
      render :notfound, status: :not_found
    end

  end
end
