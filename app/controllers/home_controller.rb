class HomeController < ApplicationController
  def index
    @books = Book.all
    @users = User.all
    @borrows = Borrow.includes(:book, :user).all
    @returns = Return.includes(borrow: [ :book, :user ]).all
  end
end
