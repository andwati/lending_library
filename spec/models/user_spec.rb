require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:borrows) }
  it { should have_many(:books).through(:borrows) }

  it "is valid with valid attributes" do
    user = User.new(first_name: "John", last_name: "Doe")
    expect(user).to be_valid
  end

  it "is invalid without a first name" do
    user = User.new(last_name: "Doe")
    expect(user).not_to be_valid
  end

  it "is invalid without a last name" do
    user = User.new(first_name: "John")
    expect(user).not_to be_valid
  end
end
