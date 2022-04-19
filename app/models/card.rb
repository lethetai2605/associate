class Card < ApplicationRecord
  belongs_to :user
  has_one :bank_info
end
