class Game < ApplicationRecord
  has_many :involved_companies
  has_many :companies, through: :involved_companies

  has_and_belongs_to_many :platforms
  has_and_belongs_to_many :genre

  #self join association
  has_many :expansions, class_name: "Game", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Game", optional: true

  has_many :reviews, as: :reviewable

  #enums
  enum category: { main_game: 0, expansion: 1 }

  #validators
  validates :name, :category, presence: true
  validates :name, uniqueness: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validate :game_id_if_expansion_category

  def game_id_if_expansion_category
    if category == "expansion" and parent.nil?
      errors.add(:game_id, "Parent game don't exist")
    end
  end
end