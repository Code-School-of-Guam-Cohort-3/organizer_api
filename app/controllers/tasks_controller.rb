class TasksController < ApplicationController
  # CRUD
  # Create
  # Read - Index and Show
  # Update
  # Destroy

  # READ - ALL TASKS
  def index
    tasks = Task.all

    render json: tasks
  end


  # CREATE
  def create
    task = Task.new(
      name: params[:name],
      description: params[:description]
    )

    if task.save
      # HAPPY PATH
      render json: task, status: :created
    else
      # SAD PATH
      render json: { errors: task.errors.full_messages },
        status: :unprocessable_entity
    end
  end


  # READ - ONE TASK
  def show
    task = Task.find_by(id: params[:id])

    if task
      # HAPPY PATH
      render json: task
    else
      # SAD PATH
      render json: { message: "Task doesn't exist." },
        status: :not_found
    end
  end


  # UPDATE
  def update
    task = Task.find_by(id: params[:id])

    if task
      if task.update(
        name: params[:name],
        description: params[:description]
      )
        # HAPPY PATH
        render json: task
      else
        # SAD PATH - Task exists, but update failed
        render json: { errors: task.errors.full_messages },
          status: :unprocessable_entity
      end
    else
      # SAD PATH - Task doesn't exist
      render json: { message: "Task doesn't exist." },
        status: :not_found
    end
  end


  # DESTROY
  def destroy
    task = Task.find_by(id: params[:id])

    if task
      # HAPPY PATH
      task.destroy

      render json: { message: "Task deleted." }
    else
      # SAD PATH
      render json: { message: "Task doesn't exist." },
        status: :not_found
    end
  end
end