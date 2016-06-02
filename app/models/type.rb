class Type < ApplicationRecord
  has_and_belongs_to_many :cards

  validates_uniqueness_of :name

  PERMANENTS     = %i(artifact creature enchantment land planeswalker)
  NON_PERMANENTS = %i(instant sorcery)
  ALL_TYPES      = PERMANENTS + NON_PERMANENTS

  ALL_TYPES.each do |type_name|
    scope type_name, -> { find_by(name: type_name) }
  end

  scope :permanent, -> { where(name: PERMANENTS) }
end
