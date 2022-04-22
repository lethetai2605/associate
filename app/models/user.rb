class User < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_one :profile, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :events, through: :enrollments
  has_one :card, dependent: :destroy
  has_one :bank_info, through: :card
  has_many :comments

  scope :sort_by_created_at, -> { order("created_at DESC") }
  scope :sort_by_name, -> { joins(:profile).order("name ASC")}

  def is_admin?
    is_admin == true
  end

  def self.search(term)
    if term
      joins(:profile).where('name LIKE ?', "%#{term}%")
    end
  end
  def authenticate pass
    password == pass
  end
end
