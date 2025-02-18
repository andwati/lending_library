class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :update, :destroy ]

  # GET /books - Retrieve all books
  def index
    books = Book.all
    render json: books
  end

  # GET /books/:id - Retrieve a single book
  def show
    render json: @book
  end

  # POST /books - Create a new book
  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: :created
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/:id - Update book details
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /books/:id - Delete a book
  def destroy
    @book.destroy
    head :no_content
  end

  private

  def set_book
    @book = Book.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Book not found" }, status: :not_found
  end

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
