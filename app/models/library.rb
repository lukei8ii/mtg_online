class Library

  attr_reader :cards

  def initialize(deck)
    @cards = []

    deck.deck_cards.each do |deck_card|
      deck_card.amount.times do
        @cards << deck_card.card
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end
end
