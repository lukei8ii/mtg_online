class GamesController < ApplicationController

  # before_action :authenticate_user!, only: [:show]

  def index
  end

  def show
    @deck1 = params[:deck1].present? ? Deck.with_cards.find(params[:deck1]) : Deck.with_cards.find(rand(1..5))
    @deck2 = params[:deck2].present? ? Deck.with_cards.find(params[:deck2]) : Deck.with_cards.find(rand(1..5))

    @player1 = User.first
    @player2 = User.second

    @player1.library = Library.new @deck1
    @player2.library = Library.new @deck2

    @player1.library.shuffle!
    @player2.library.shuffle!
  end
end
