class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: :ingredient }
  validates :ingredient, presence: true, uniqueness: { scope: :cocktail }
  # validates :id, uniqueness: { scope: [ :cocktail_id, :ingredient_id] }
end
