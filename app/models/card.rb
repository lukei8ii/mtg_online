class Card < ApplicationRecord
  has_and_belongs_to_many :colors
  has_and_belongs_to_many :types
  has_and_belongs_to_many :subtypes

  has_many :deck_cards, inverse_of: :card
  has_many :decks, through: :deck_cards

  accepts_nested_attributes_for :colors
  accepts_nested_attributes_for :types
  accepts_nested_attributes_for :subtypes
end
