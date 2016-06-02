class Card < ApplicationRecord
  include Wisper::Publisher

  has_and_belongs_to_many :colors
  has_and_belongs_to_many :types
  has_and_belongs_to_many :subtypes

  has_many :deck_cards, inverse_of: :card
  has_many :decks, through: :deck_cards

  accepts_nested_attributes_for :colors
  accepts_nested_attributes_for :types
  accepts_nested_attributes_for :subtypes

  attr_accessor :owner
  attr_accessor :original_owner
  attr_accessor :container

  %i(creature instant enchantment sorcery planeswalker artifact land).each do |type_name|
	  define_method("is_#{type_name}?") do
      types.include? Type.send(type_name)
  	end
  end

  def is_permanent?
    types.include? Type.permanent
  end

  def in_hand?
    @container == @owner.hand
  end

  def can_play_in_turn_part?(part)
    true
  end

  def can_play?
    throw "Card has no owner" unless @owner

    return false unless in_hand?
    return false unless @owner.is_turn?
    return unless can_play_in_turn_part? @game.current_part
    return false unless @owner.can_pay_cost? card
  end

  def play!
    @owner.pay_cost! self

    if card.is_creature?
      move_to @battlefield.main
    elsif card.is_land?
      move_to @battlefield.land
    elsif card.is_permanent?
      move_to @battlefield.side
    else
      move_to @game.stack
    end

    broadcast(:entered_battlefield, self)

    self
  end

  def move_to(new_container)
    throw "Can't move here" unless new_container

    @container.slice!(@container.index(self)) if @container
    new_container << self
    @container = new_container
  end
end
