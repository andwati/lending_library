class BorrowsController < ApplicationController
  before_action :set_user, only: [ :user_borrows ]
  before_action :set_book, only: [ :book_borrows ]

  def new
    @users = User.all
    @books = Book.all
    @borrow = Borrow.new
    @selected_book = params[:book_id] ? Book.find(params[:book_id]) : nil
  end

  def create
    @borrow = Borrow.new(borrow_params)
    @borrow.date_borrowed = Time.current
    @borrow.due_date = Time.current + @borrow.duration.days

    if @borrow.save
      redirect_to books_path, notice: "Book borrowed successfully."
    else
      render :new
    end
  end

  def user_borrows
    @borrows = Borrow.where(user_id: params[:user_id])
  end

  def book_borrows
    @borrows = Borrow.where(book_id: params[:book_id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def borrow_params
    params.require(:borrow).permit(:book_id, :user_id, :duration)
  end
end
