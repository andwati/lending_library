require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:valid_attributes) { { title: "The Pragmatic Programmer", author: "Andy Hunt" } }
  let(:invalid_attributes) { { title: "", author: "" } }
  let!(:book) { Book.create(valid_attributes) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: book.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Book" do
        expect {
          post :create, params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Book" do
        expect {
          post :create, params: { book: invalid_attributes }
        }.to_not change(Book, :count)
      end
    end
  end
end
