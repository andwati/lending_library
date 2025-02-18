require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should have_many(:borrows) }
  it { should have_many(:returns).through(:borrows) }

  it "is valid with valid attributes" do
    book = Book.new(title: "The Pragmatic Programmer", author: "Andy Hunt")
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(author: "Andy Hunt")
    expect(book).not_to be_valid
  end

  it "is invalid without an author" do
    book = Book.new(title: "The Pragmatic Programmer")
    expect(book).not_to be_valid
  end
end
