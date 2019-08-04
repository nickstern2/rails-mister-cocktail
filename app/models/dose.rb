class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates :description, presence: true
  validates_uniqueness_of :ingredient_id, :scope => [:cocktail_id]
end

