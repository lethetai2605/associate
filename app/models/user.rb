class User < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_one :address, dependent: :destroy
  has_many :enrollments
  has_many :events, through: :enrollments
  has_one :card
  has_one :bank_info, through: :card
  has_many :comments, as: :commentable
end
