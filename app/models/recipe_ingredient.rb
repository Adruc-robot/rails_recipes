class RecipeIngredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :ingredient
    belongs_to :unit
    belongs_to :user
end
