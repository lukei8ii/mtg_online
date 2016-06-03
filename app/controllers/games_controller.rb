class GamesController < ApplicationController

  before_action :authenticate_user!, only: [:show]

  def index
  end

  def show
    @deck1 = params[:deck1].present? ? Deck.with_cards.find(params[:deck1]) : Deck.with_cards.find(rand(1..5))
    @deck2 = params[:deck2].present? ? Deck.with_cards.find(params[:deck2]) : Deck.with_cards.find(rand(1..5))

    @player1 = current_user
    @player2 = User.second

    @player1.choose_deck @deck1
    @player2.choose_deck @deck2

    @game = Game.new [@player1, @player2]

    7.times do
      @player1.draw!
      @player1.hand.first.play!
      @player2.draw!
      @player2.hand.first.play!
    end

    2.times do
      @player1.cards_in_play.first.destroy!
      @player2.cards_in_play.first.destroy!
    end

    @messages = 5.times.map do
      Message.new([@player1, @player2].sample, "testing chat!")
    end
  end
end
