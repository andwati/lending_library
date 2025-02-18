class UsersController < ApplicationController
  before_action :set_user, only: [ :show ]

  # GET /users - Retrieve all users
  def index
    users = User.all
    render json: users
  end

  # GET /users/:id - Retrieve a single user
  def show
    render json: @user
  end

  # POST /users - Create a new user
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
