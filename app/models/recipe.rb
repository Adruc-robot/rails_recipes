class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_steps, dependent: :destroy
    has_many :recipe_ingredients, dependent: :destroy
    has_many :ingredients, :through => :recipe_ingredients
    has_many :units, :through => :recipe_ingredients
    has_many :meal_preps

    validates :name, presence: true
end
