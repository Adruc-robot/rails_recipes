class Ingredient < ApplicationRecord
    belongs_to :user
    belongs_to :state
    belongs_to :location
    has_many :recipe_ingredients
end
