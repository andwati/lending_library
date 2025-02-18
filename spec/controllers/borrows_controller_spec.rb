require 'rails_helper'

RSpec.describe BorrowsController, type: :controller do
  let!(:user) { User.create(first_name: "John", last_name: "Doe") }
  let!(:book) { Book.create(title: "The Pragmatic Programmer", author: "Andy Hunt") }
  let(:valid_attributes) { { user_id: user.id, book_id: book.id, duration: 7 } }

  describe "POST #create" do
    it "creates a new Borrow record" do
      expect {
        post :create, params: { borrow: valid_attributes }
      }.to change(Borrow, :count).by(1)
    end
  end
end
