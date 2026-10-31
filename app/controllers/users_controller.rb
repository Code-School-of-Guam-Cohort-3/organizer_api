class UsersController < ApplicationController

  before_action :authorize_request, except: [:index, :show, :create]

  def index
    users = User.all

    render json: users
  end

  # roles = ["admin", "user"]
  # CREATE
  def create
    user = User.new(
      name: params[:name] || Faker::Name.name,
      email: params[:email] || "#{Faker::Name.name}@gmail.com",
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      user_role: params[:user_role] || "user"
    )

    if user.save
      # HAPPY PATH
      render json: user, status: :created
    else
      # SAD PATH
      render json: { errors: user.errors.full_messages },
        status: :unprocessable_entity
    end
  end


  # READ - ONE TASK
  def show
    user = User.find_by(id: params[:id])
    p "--------------------------------------"
    puts params
    p "--------------------------------------"
    if user
      # HAPPY PATH
      render json: user
    else
      # SAD PATH
      render json: { message: "User doesn't exist in database." },
        status: :not_found
    end
  end


  # UPDATE
  def update
    user = User.find_by(id: params[:id])

    if user
      if user.update(
        name: params[:name],
        description: params[:description],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        user_role: params[:user_role] || "user"
      )
        # HAPPY PATH
        render json: user
      else
        # SAD PATH - Task exists, but update failed
        render json: { errors: user.errors.full_messages },
          status: :unprocessable_entity
      end
    else
      # SAD PATH - Task doesn't exist
      render json: { message: "User doesn't exist in database." },
        status: :not_found
    end
  end


  # DESTROY
  def destroy
    user = User.find_by(id: params[:id])

    if user
      # HAPPY PATH
      user.destroy

      render json: { message: "User removed." }
    else
      # SAD PATH
      render json: { message: "User doesn't exist." },
        status: :not_found
    end
  end
end
