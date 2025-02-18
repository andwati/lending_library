require 'rails_helper'

RSpec.describe Borrow, type: :model do
  it { should belong_to(:book) }
  it { should belong_to(:user) }
  it { should have_one(:return) }

  it "is invalid without a book" do
    borrow = Borrow.new(user: User.new, date_borrowed: Time.now, duration: 7, due_date: 7.days.from_now)
    expect(borrow).not_to be_valid
  end

  it "is invalid without a user" do
    borrow = Borrow.new(book: Book.new, date_borrowed: Time.now, duration: 7, due_date: 7.days.from_now)
    expect(borrow).not_to be_valid
  end
end
