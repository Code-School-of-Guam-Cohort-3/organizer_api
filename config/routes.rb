Rails.application.routes.draw do
  get "/tasks" => "tasks#index"
  post "/tasks" => "tasks#create"
  get "/tasks/:id" => "tasks#show"
  put "/tasks/:id" => "tasks#update"
  delete "/tasks/:id" => "tasks#destroy"

  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"

  # restful crud routes - restful convention - REST API
end
