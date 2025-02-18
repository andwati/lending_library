class Borrow < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_one :return
end
