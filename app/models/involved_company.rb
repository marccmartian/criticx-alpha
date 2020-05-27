class InvolvedCompany < ApplicationRecord
  belongs_to :company
  belongs_to :game

  #validators
  #validates :developer, :publisher, presence:true
  validates :developer, inclusion: { in: [true, false] }
  validates :publisher, inclusion: { in: [true, false] }
end