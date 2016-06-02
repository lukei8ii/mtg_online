class Color < ApplicationRecord
  has_and_belongs_to_many :cards

  validates_uniqueness_of :name

  %i(black blue green red white).each do |color_name|
    scope color_name, -> { find_by(name: color_name) }
  end
end
