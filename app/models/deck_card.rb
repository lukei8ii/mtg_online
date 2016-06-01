class DeckCard < ApplicationRecord
  self.table_name = "decks_cards"

  belongs_to :card
  belongs_to :deck
end
