Rails.application.routes.draw do
  root "tasks#index"
  # route to GET all tasks
  get '/tasks', to: 'tasks#index', as: 'tasks' # provides a path to books
  # route to GET new task form
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  # route to POST new task to db
  post '/tasks', to: 'tasks#create'

  #  route to GET edit form
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  # route to retrieve a specific task
  get '/tasks/:id', to: 'tasks#show', as: 'task'

  # route to PATCH mark a task as complete
  patch '/task/:id/completed', to: 'tasks#complete', as: 'task_complete'
  # route to PATCH mark a task as complete
  patch '/task/:id/incomplete', to: 'tasks#incomplete', as: 'task_incomplete'
  # route to PATCH/PUT update a task
  patch '/tasks/:id', to: 'tasks#update'
  # route to DELETE a task
  delete '/tasks/:id', to: 'tasks#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
