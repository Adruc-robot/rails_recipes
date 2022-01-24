require "application_system_test_case"

class RecipeStepsTest < ApplicationSystemTestCase
  setup do
    @recipe_step = recipe_steps(:one)
  end

  test "visiting the index" do
    visit recipe_steps_url
    assert_selector "h1", text: "Recipe steps"
  end

  test "should create recipe step" do
    visit recipe_steps_url
    click_on "New recipe step"

    fill_in "Recipe", with: @recipe_step.recipe_id
    fill_in "Step number", with: @recipe_step.step_number
    fill_in "Step text", with: @recipe_step.step_text
    click_on "Create Recipe step"

    assert_text "Recipe step was successfully created"
    click_on "Back"
  end

  test "should update Recipe step" do
    visit recipe_step_url(@recipe_step)
    click_on "Edit this recipe step", match: :first

    fill_in "Recipe", with: @recipe_step.recipe_id
    fill_in "Step number", with: @recipe_step.step_number
    fill_in "Step text", with: @recipe_step.step_text
    click_on "Update Recipe step"

    assert_text "Recipe step was successfully updated"
    click_on "Back"
  end

  test "should destroy Recipe step" do
    visit recipe_step_url(@recipe_step)
    click_on "Destroy this recipe step", match: :first

    assert_text "Recipe step was successfully destroyed"
  end
end
