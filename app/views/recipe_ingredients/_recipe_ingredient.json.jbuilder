json.extract! recipe_ingredient, :id, :recipe_id, :ingredient_id, :amount, :unit_id, :prep_instructions, :user_id, :created_at, :updated_at
json.url recipe_ingredient_url(recipe_ingredient, format: :json)
