class GamesController < ApplicationController

  def show
    @deck = params[:deck].present? ? Deck.with_cards.find(params[:deck]) : Deck.with_cards.first
    @library = Library.new @deck
    @library.shuffle!
  end
end
