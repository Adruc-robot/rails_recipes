require "test_helper"

class RecipeStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe_step = recipe_steps(:one)
  end

  test "should get index" do
    get recipe_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_recipe_step_url
    assert_response :success
  end

  test "should create recipe_step" do
    assert_difference("RecipeStep.count") do
      post recipe_steps_url, params: { recipe_step: { recipe_id: @recipe_step.recipe_id, step_number: @recipe_step.step_number, step_text: @recipe_step.step_text } }
    end

    assert_redirected_to recipe_step_url(RecipeStep.last)
  end

  test "should show recipe_step" do
    get recipe_step_url(@recipe_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipe_step_url(@recipe_step)
    assert_response :success
  end

  test "should update recipe_step" do
    patch recipe_step_url(@recipe_step), params: { recipe_step: { recipe_id: @recipe_step.recipe_id, step_number: @recipe_step.step_number, step_text: @recipe_step.step_text } }
    assert_redirected_to recipe_step_url(@recipe_step)
  end

  test "should destroy recipe_step" do
    assert_difference("RecipeStep.count", -1) do
      delete recipe_step_url(@recipe_step)
    end

    assert_redirected_to recipe_steps_url
  end
end
