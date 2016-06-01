class Player < User
  attr_accessor :library
  attr_accessor :hand
  attr_accessor :graveyard

  def draw!(amount = 7)
    (@hand ||= []).concat(@library.cards.shuffle!.shift(amount))
  end

  def deck_name
    @library.deck.name
  end
end
