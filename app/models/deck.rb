class Deck < ApplicationRecord
  has_many :deck_cards, inverse_of: :deck
  has_many :cards, through: :deck_cards

  validates_uniqueness_of :name

  scope :with_cards, -> { includes(:cards) }
end
