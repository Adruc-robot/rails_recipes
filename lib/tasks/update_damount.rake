namespace :update_damount do
    desc "populate damount"
    task :updateDamount => [:environment] do
        @recipe_ingredients = RecipeIngredient.where(damount: nil)

        @recipe_ingredients.each do |recipe_ingredient| 
            recipe_ingredient.damount = Fractional.new(recipe_ingredient.amount).to_f
            recipe_ingredient.save
        end
    end
end
