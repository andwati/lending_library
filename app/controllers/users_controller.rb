class UsersController < ApplicationController
  before_action :set_user, only: [ :show ]

  # GET /users - Retrieve all users
  def index
    users = User.all
    render json: users
  end

  # GET /users/:id - Retrieve a single user
  def show
    @borrows = Borrow.where(user: @user).includes(:book)
    @returns = Return.joins(:borrow).where(borrows: { user_id: @user.id }).includes(borrow: :book)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "User created successfully!"
    else
      render :new
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
