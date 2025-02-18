class BooksController < ApplicationController
  before_action :set_book, only: [ :show, :edit, :update, :destroy ]

  # GET /books - Show list of books
  def index
    @books = Book.all
  end

  # GET /books/:id - View a single book
  def show
  end

  # GET /books/new - Show form to create a book
  def new
    @book = Book.new
  end

  # POST /books - Create a new book
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "Book created successfully."
    else
      render :new
    end
  end

  # GET /books/:id/edit - Show form to edit a book
  def edit
  end

  # PATCH/PUT /books/:id - Update book details
  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Book updated successfully."
    else
      render :edit
    end
  end

  # DELETE /books/:id - Delete a book
  def destroy
    @book.destroy
    redirect_to books_path, notice: "Book deleted successfully."
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
