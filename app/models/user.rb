class User < ApplicationRecord
  has_many :reviews

  #callback
  before_create do |user|
    user.review_count = 0
  end

  #validations
  validates :username, :email, presence: true, uniqueness: true
  validate :birth_date_cannot_be_less_than_16

  def birth_date_cannot_be_less_than_16
    if birth_date.present? and birth_date > 16.years.ago
      errors.add(:birth_date, "You should be 16 years old to create an account")
    end
  end
end