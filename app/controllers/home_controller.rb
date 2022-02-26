class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin == "T"
        @recipes = Recipe.all.order(name: :asc)
      else
        #@recipes = current_user.recipes.or(Recipe.where(global: "T", status: "PB")).order(name: :asc)
        @recipes = Recipe.where("user_id=? or (global=? and status=?)",current_user.id,"T","PB").order(name: :asc)
      end
    else
        @recipes = Recipe.where(global: "T", status: "PB").order(name: :asc)
    end
  end
  
  def about
  end
end
