class Card < ApplicationRecord
  belongs_to :user
  has_one :bank_info

  def mask_credit_card_number
    trimmed_number = number.to_s.delete(' ')
    trimmed_number[-3..-1].rjust(trimmed_number.length, 'X')
  end
end
