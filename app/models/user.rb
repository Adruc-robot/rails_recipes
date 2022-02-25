class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :units
  has_many :states
  has_many :ingredients
  has_many :locations
  has_many :recipes
  has_many :recipe_ingredients
  has_many :recipe_steps
  has_many :meal_preps
end
