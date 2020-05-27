class Genre < ApplicationRecord
  has_and_belongs_to_many :games

  #validators
  validates :name , presence:true, uniqueness: true
end