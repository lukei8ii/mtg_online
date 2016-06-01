class Type < ApplicationRecord
  has_and_belongs_to_many :cards

  validates_uniqueness_of :name
end
