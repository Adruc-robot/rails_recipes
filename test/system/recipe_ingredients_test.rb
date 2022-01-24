require "application_system_test_case"

class RecipeIngredientsTest < ApplicationSystemTestCase
  setup do
    @recipe_ingredient = recipe_ingredients(:one)
  end

  test "visiting the index" do
    visit recipe_ingredients_url
    assert_selector "h1", text: "Recipe ingredients"
  end

  test "should create recipe ingredient" do
    visit recipe_ingredients_url
    click_on "New recipe ingredient"

    fill_in "Global", with: @recipe_ingredient.global
    fill_in "Ingredient", with: @recipe_ingredient.ingredient_id
    fill_in "Prep instructions", with: @recipe_ingredient.prep_instructions
    fill_in "Recipe", with: @recipe_ingredient.recipe_id
    fill_in "Unit", with: @recipe_ingredient.unit_id
    fill_in "User", with: @recipe_ingredient.user_id
    click_on "Create Recipe ingredient"

    assert_text "Recipe ingredient was successfully created"
    click_on "Back"
  end

  test "should update Recipe ingredient" do
    visit recipe_ingredient_url(@recipe_ingredient)
    click_on "Edit this recipe ingredient", match: :first

    fill_in "Global", with: @recipe_ingredient.global
    fill_in "Ingredient", with: @recipe_ingredient.ingredient_id
    fill_in "Prep instructions", with: @recipe_ingredient.prep_instructions
    fill_in "Recipe", with: @recipe_ingredient.recipe_id
    fill_in "Unit", with: @recipe_ingredient.unit_id
    fill_in "User", with: @recipe_ingredient.user_id
    click_on "Update Recipe ingredient"

    assert_text "Recipe ingredient was successfully updated"
    click_on "Back"
  end

  test "should destroy Recipe ingredient" do
    visit recipe_ingredient_url(@recipe_ingredient)
    click_on "Destroy this recipe ingredient", match: :first

    assert_text "Recipe ingredient was successfully destroyed"
  end
end
