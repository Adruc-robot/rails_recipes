class CreateUpdateController < ApplicationController
    #people need to be authenticated to see this
    before_action :authenticate_user!
    def index
        #if current_user.admin
            #@recipePicker = Recipe.all
            @recipePicker = current_user.recipes.select(:name, :id).order(name: :asc)
        #else
            #@recipePicker = current_user.recipes.select(:name, :id).order(name: :asc)
        #end
        #@recipePicker = Recipe.all
        #@jointest = Recipe.select("ingredients.name ingName,recipe_ingredients.amount,units.name uniName").joins(:recipe_ingredients => [:units, :ingredients]).where("recipes.id = 4")
        #@jointest = Recipe.select("ingredients.name ingName,recipe_ingredients.amount,units.name uniName").joins(:recipe_ingredients => [ingredients:, units:]).where("recipes.id = 4")
        @jointest = Recipe.select("recipes.name recName,ingredients.name ingName,recipe_ingredients.amount,units.name uniName").joins(recipe_ingredients:  [:ingredient, :unit]).where("recipes.id = 4").order("recipes.id, ingredients.name desc")
        #@jointest = Recipe.select("ingredients.name ingName,recipe_ingredients.amount,recipe_ingredients.unit_id").joins(recipe_ingredients:  [:ingredients]).where("recipes.id = 4")
        #@jointest = Recipe.select("ingredients.name ingName,recipe_ingredients.amount,recipe_ingredients.unit_id").joins(recipe_ingredients:  [:ingredients]).where("recipes.id = 4")
        #@jointest = Recipe.joins(:recipe_ingredients).where("recipes.id = 4")
        #@jointest = Recipe.joins(recipe_ingredients: [:ingredient]).where("recipes.id = 4").select("recipe_ingredients.unit_id doot,ingredients.name beep")

    end
    def getdata
        # this contains what has been selected in the first select box
        #@data_from_select1 = params[:first_select]
    
        # we get the data for selectbox 2
        #@data_for_select2 = MyModel.where(:some_id => @data_from_select1).all
    
        # render an array in JSON containing arrays like:
        # [[:id1, :name1], [:id2, :name2]]
        #render :json => @data_for_select2.map{|c| [c.id, c.name]}
      end

end