class Turn
  include Wisper::Publisher

  attr_accessor :game
  attr_accessor :parts
  attr_accessor :owner

  PARTS = [
    :beginning_phase,
    :untap_step,
    :upkeep_step,
    :draw_step,
    :pre_main_phase,
    :combat_phase,
    :beginning_of_combat_step,
    :declare_attackers_step,
    :declare_blockers_step,
    :combat_damage_step,
    :end_of_combat_step,
    :post_main_phase,
    :ending_phase,
    :end_step,
    :cleanup_step
  ]

  def initialize(game, player)
    @game = game
    @owner = player
    @parts = Array.new(PARTS)

    broadcast(:new_turn)
  end

  def current_part
    @parts.first
  end

  def next_part!
    return false if is_last_part?
    @parts.shift

    broadcast(current_part)

    current_part
  end

  def is_last_part?
    @parts.count == 1
  end

  def is_begin?
    [:beginning_phase,
      :untap_step,
      :upkeep_step,
      :draw_step
    ].include? current_part
  end

  def is_pre_main?
    current_part == :pre_main_phase
  end

  def is_attack?
    [:combat_phase,
      :beginning_of_combat_step,
      :declare_attackers_step
    ].include? current_part
  end

  def is_block?
    current_part == :declare_blockers_step
  end

  def is_damage?
    [:combat_damage_step,
      :end_of_combat_step
    ].include? current_part
  end

  def is_post_main?
    [:post_main_phase,
      :ending_phase,
      :end_step,
      :cleanup_step
    ].include? current_part
  end
end
