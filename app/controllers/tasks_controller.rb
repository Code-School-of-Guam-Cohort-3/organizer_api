class TasksController < ApplicationController
  # CRUD
  # Create Read (index and show) Update Destroy

  def index
    task = Task.all

    render json: task
  end

  def create
    if params[:name]
      task = Task.create(
        name: params[:name],
        description: params[:description]
      )

      render json: task, status: :created
    else
      render json: {message: "Please include the name field."}, status: :not_acceptable
    end
  end
end
