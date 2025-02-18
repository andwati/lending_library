require 'rails_helper'

RSpec.describe Return, type: :model do
  it { should belong_to(:borrow) }

  it "calculates penalty correctly when overdue" do
    borrow = Borrow.new(date_borrowed: 10.days.ago, duration: 5, due_date: 5.days.ago)
    return_record = Return.new(borrow: borrow, date_returned: Time.now, overdue: true)
    penalty = (return_record.date_returned.to_date - borrow.due_date).to_i * 10

    expect(penalty).to eq(return_record.penalty)
  end
end
