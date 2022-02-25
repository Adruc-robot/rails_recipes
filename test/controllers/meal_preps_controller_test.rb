require "test_helper"

class MealPrepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal_prep = meal_preps(:one)
  end

  test "should get index" do
    get meal_preps_url
    assert_response :success
  end

  test "should get new" do
    get new_meal_prep_url
    assert_response :success
  end

  test "should create meal_prep" do
    assert_difference("MealPrep.count") do
      post meal_preps_url, params: { meal_prep: { meal_date: @meal_prep.meal_date, meal_type: @meal_prep.meal_type, recipes_id: @meal_prep.recipes_id, users_id: @meal_prep.users_id } }
    end

    assert_redirected_to meal_prep_url(MealPrep.last)
  end

  test "should show meal_prep" do
    get meal_prep_url(@meal_prep)
    assert_response :success
  end

  test "should get edit" do
    get edit_meal_prep_url(@meal_prep)
    assert_response :success
  end

  test "should update meal_prep" do
    patch meal_prep_url(@meal_prep), params: { meal_prep: { meal_date: @meal_prep.meal_date, meal_type: @meal_prep.meal_type, recipes_id: @meal_prep.recipes_id, users_id: @meal_prep.users_id } }
    assert_redirected_to meal_prep_url(@meal_prep)
  end

  test "should destroy meal_prep" do
    assert_difference("MealPrep.count", -1) do
      delete meal_prep_url(@meal_prep)
    end

    assert_redirected_to meal_preps_url
  end
end
