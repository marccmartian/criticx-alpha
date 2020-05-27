class Review < ApplicationRecord
  #relationships
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  #callback
  after_create do |review|
    user = review.user
    user.update(review_count: user.review_count + 1)
  end

  after_destroy do |review|
    user = review.user
    user.update(review_count: user.review_count - 1)
  end

  #validators
  validates :title, :body, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum:40 }
end