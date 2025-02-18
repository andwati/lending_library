require 'rails_helper'

RSpec.describe ReturnsController, type: :controller do
  let!(:user) { User.create(first_name: "John", last_name: "Doe") }
  let!(:book) { Book.create(title: "The Pragmatic Programmer", author: "Andy Hunt") }
  let!(:borrow) { Borrow.create(user: user, book: book, date_borrowed: Time.now, duration: 7, due_date: 7.days.from_now) }
  let(:valid_attributes) { { borrow_id: borrow.id } }

  describe "POST #create" do
    it "creates a new Return record" do
      expect {
        post :create, params: { return: valid_attributes }
      }.to change(Return, :count).by(1)
    end
  end
end
