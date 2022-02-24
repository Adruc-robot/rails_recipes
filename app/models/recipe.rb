class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_steps, dependent: :destroy
    has_many :recipe_ingredients, dependent: :destroy

    validates :name, presence: true
end
