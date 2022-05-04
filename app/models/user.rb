# frozen_string_literal: true

class User < ApplicationRecord
  CSV_ATTRIBUTES = %w[email created_at].freeze
  has_many :posts, dependent: :nullify
  has_one :profile, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :events, through: :enrollments
  has_one :card, dependent: :destroy
  has_one :bank_info, through: :card
  has_many :comments

  scope :sort_by_created_at, -> { order('created_at DESC') }
  scope :sort_by_name, -> { joins(:profile).order('name ASC') }

  def admin?
    is_admin == true
  end

  def self.search(term)
    return unless term

    joins(:profile).where('name LIKE ?', "%#{term}%")
  end

  def authenticate(pass)
    password == pass
  end
end
