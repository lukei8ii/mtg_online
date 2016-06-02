class Game
  include Wisper::Publisher

  attr_accessor :players
  attr_accessor :stack
  attr_accessor :turns

  def initialize(players)
    throw "A game needs at least 2 players" unless players.count > 1

    @players = players
    @stack = []
    @turns = []

    @players.each do |player|
      player.get_ready self
    end

    broadcast(:new_game)

    next_part!
  end

  def current_turn
    @turns.first
  end

  def current_part
    current_turn.current_part
  end

  def next_part!
    if !current_turn || current_turn.is_last_part?
      next_turn!
    else
      current_turn.next_part!
    end

    current_part
  end

  def next_turn!
    if @turns.count > 1
      @turns.shift
      @turns << Turn.new(self, next_player) unless @turns.any?
    else
      @turns << Turn.new(self, @players.sample) unless current_turn
    end

    current_turn
  end

  def current_player
    current_turn.owner
  end

  def next_player
    player_index = @players.index(current_player)
    player_index = player_index >= @players.count ? 0 : player_index + 1

    @players[player_index]
  end

  def self.test
    deck1 = Deck.with_cards.find(rand(1..5))
    deck2 = Deck.with_cards.find(rand(1..5))

    player1 = Player.first
    player2 = Player.second

    player1.choose_deck deck1
    player2.choose_deck deck2

    self.new [player1, player2]
  end
end
