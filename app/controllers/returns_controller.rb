class ReturnsController < ApplicationController
  before_action :set_borrow, only: [ :create ]

  # POST /return - Return a book
  def create
    date_returned = Time.current
    overdue = date_returned > @borrow.due_date
    penalty = overdue ? (date_returned.to_date - @borrow.due_date).to_i * 10 : 0

    returned = Return.new(
      borrow: @borrow,
      date_returned: date_returned,
      overdue: overdue,
      penalty: penalty
    )

    if returned.save
      render json: returned, status: :created
    else
      render json: { errors: returned.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /return/user/:user_id - Get books returned by a user
  def user_returns
    returns = Return.joins(:borrow).where(borrows: { user_id: params[:user_id] })
    render json: returns
  end

  # GET /return/book/:book_id - Get return history of a book
  def book_returns
    returns = Return.joins(:borrow).where(borrows: { book_id: params[:book_id] })
    render json: returns
  end

  private

  def set_borrow
    @borrow = Borrow.find(params[:borrow_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Borrow record not found" }, status: :not_found
  end
end
