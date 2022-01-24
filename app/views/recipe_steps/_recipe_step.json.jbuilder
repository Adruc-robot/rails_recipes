json.extract! recipe_step, :id, :recipe_id, :step_number, :step_text, :created_at, :updated_at
json.url recipe_step_url(recipe_step, format: :json)
