class ReturnsController < ApplicationController
  before_action :set_user, only: [ :user_returns ]
  before_action :set_book, only: [ :book_returns ]

  def new
    @borrows = Borrow.all
    @return = Return.new
  end

  def create
    borrow = Borrow.find(params[:return][:borrow_id])
    date_returned = Time.current
    overdue = date_returned > borrow.due_date
    penalty = overdue ? (date_returned.to_date - borrow.due_date).to_i * 10 : 0

    @return = Return.new(borrow: borrow, date_returned: date_returned, overdue: overdue, penalty: penalty)

    if @return.save
      redirect_to books_path, notice: "Book returned successfully."
    else
      render :new
    end
  end

  def user_returns
    @returns = Return.joins(:borrow).where(borrows: { user_id: params[:user_id] })
  end

  def book_returns
    @returns = Return.joins(:borrow).where(borrows: { book_id: params[:book_id] })
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
