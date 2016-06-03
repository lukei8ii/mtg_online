class Library

  attr_accessor :owner
  attr_reader :deck
  attr_reader :cards

  def initialize(owner, deck)
    @owner = owner
    @deck = deck
    @cards = []

    @deck.deck_cards.each do |deck_card|
      deck_card.amount.times do
        card = deck_card.card
        card.owner = @owner
        card.original_owner = @owner
        card.move_to @cards
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end
end
