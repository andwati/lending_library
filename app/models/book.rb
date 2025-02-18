class Book < ApplicationRecord
  has_many :borrows
  has_many :returns, through: :borrows
end
