class User < ApplicationRecord
  has_many :borrows
  has_many :books, through: :borrows
end
