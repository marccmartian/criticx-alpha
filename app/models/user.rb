class User < ApplicationRecord
  has_many :reviews

  #callback
  before_create do |user|
    user.review_count = 0
  end
end