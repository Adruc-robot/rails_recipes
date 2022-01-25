class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin
        @recipes = Recipe.all.order(name: :asc)
      else
        @recipes = current_user.recipes.or(Recipe.where(global: "T")).order(name: :asc)
      end
    else
        @recipes = Recipe.where(global: "T").order(name: :asc)
    end
  end
  def about
  end
end
