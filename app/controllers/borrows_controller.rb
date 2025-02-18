# class BorrowsController < ApplicationController
#   before_action :set_book, only: [ :create ]
#   before_action :set_user, only: [ :create ]

#   # POST /borrow - Borrow a book
#   def create
#     borrow = Borrow.new(
#       book: @book,
#       user: @user,
#       date_borrowed: Time.current,
#       duration: borrow_params[:duration],
#       due_date: Time.current + borrow_params[:duration].to_i.days
#     )

#     if borrow.save
#       render json: borrow, status: :created
#     else
#       render json: { errors: borrow.errors.full_messages }, status: :unprocessable_entity
#     end
#   end

#   # GET /borrow/user/:user_id - Get books borrowed by a user
#   def user_borrows
#     borrows = Borrow.where(user_id: params[:user_id])
#     render json: borrows
#   end

#   # GET /borrow/book/:book_id - Get borrow history of a book
#   def book_borrows
#     borrows = Borrow.where(book_id: params[:book_id])
#     render json: borrows
#   end

#   private

#   def set_book
#     @book = Book.find(params[:book_id])
#   rescue ActiveRecord::RecordNotFound
#     render json: { error: "Book not found" }, status: :not_found
#   end

#   def set_user
#     @user = User.find(params[:user_id])
#   rescue ActiveRecord::RecordNotFound
#     render json: { error: "User not found" }, status: :not_found
#   end

#   def borrow_params
#     params.require(:borrow).permit(:duration)
#   end
# end
class BorrowsController < ApplicationController
  def new
    @users = User.all
    @books = Book.all
    @borrow = Borrow.new
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

  private

  def borrow_params
    params.require(:borrow).permit(:book_id, :user_id, :duration)
  end
end
