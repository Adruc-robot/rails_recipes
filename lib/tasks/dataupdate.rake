namespace :dataupdate do
    desc "Import States from csv file"
    task :import_states => [:environment] do
        require "CSV"
        file = "data_imports/states.csv"

        CSV.foreach(file, :headers => true) do |row|
            State.create(
            :name => row["name"],
            :user_id => row["user_id"],
            :global => row["global"],
            )
        end
    end
    task :import_units => [:environment] do
        require "CSV"
        file = "data_imports/units.csv"

        CSV.foreach(file, :headers => true) do |row|
            Unit.create(
            :name => row["name"],
            :user_id => row["user_id"],
            :global => row["global"],
            )
        end
    end
    task :import_locations => [:environment] do
        require "CSV"
        file = "data_imports/locations.csv"

        CSV.foreach(file, :headers => true) do |row|
            Location.create(
            :name => row["name"],
            :user_id => row["user_id"],
            :global => row["global"],
            )
        end
    end
    task :import_ingredients => [:environment] do
        require "CSV"
        file = "data_imports/ingredients.csv"

        CSV.foreach(file, :headers => true) do |row|
            Ingredient.create(
            :name => row["name"],
            :user_id => row["user_id"],
            :global => row["global"],
            :state_id => row["state_id"],
            :location_id => row["location_id"]
            )
        end
    end
    task :import_recipes => [:environment] do
        require "CSV"
        file = "data_imports/recipes.csv"

        CSV.foreach(file, :headers => true) do |row|
            Recipe.create(
            :name => row["name"],
            :user_id => row["user_id"],
            :global => row["global"],
            :status => row["status"]
            )
        end
    end
    task :import_recipe_steps => [:environment] do
        require "CSV"
        file = "data_imports/recipe_steps.csv"

        CSV.foreach(file, :headers => true) do |row|
            RecipeStep.create(
            :recipe_id => row["recipe_id"],
            :step_number => row["step_number"],
            :step_text => row["step_text"],
            :user_id => row["user_id"]
            )
        end
    end
    task :import_recipe_ingredients => [:environment] do
        require "CSV"
        file = "data_imports/recipe_ingredients.csv"

        CSV.foreach(file, :headers => true) do |row|
            RecipeIngredient.create(
            :recipe_id => row["recipe_id"],
            :ingredient_id => row["ingredient_id"],
            :unit_id => row["unit_id"],
            :prep_instructions => row["prep_instructions"],
            :user_id => row["user_id"],
            :amount => row["amount"]
            )
        end
    end
end
