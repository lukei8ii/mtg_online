class Player < User

  attr_accessor :deck
  attr_accessor :game
  attr_accessor :library
  attr_accessor :hand
  attr_accessor :graveyard
  attr_accessor :battlefield
  attr_accessor :exile
  attr_accessor :life

  def choose_deck(deck)
    @deck = deck
  end

  def get_ready(game)
    throw "#{name} must choose a deck" unless @deck

    @game        = game
    @life        = 20
    @battlefield = Battlefield.new
    @graveyard   = []
    @exile       = []
    @hand        = []

    @library = Library.new(self, @deck)
    @library.cards.shuffle!

    draw! 7
  end

  def draw!(amount = 1)
    amount.times do
      @library.cards.first.move_to @hand
    end
  end

  def deck_name
    @library.deck.name
  end

  def cards_in_play
    @battlefield.cards
  end

  def is_turn?
    @game.current_player == self
  end

  def can_pay_cost?(card)
    # TODO: validate user can pay for card
  end

  def pay_cost!(card)
    # TODO: pay mana or other cost to play card
  end
end
