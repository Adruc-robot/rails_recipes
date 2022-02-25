require "application_system_test_case"

class MealPrepsTest < ApplicationSystemTestCase
  setup do
    @meal_prep = meal_preps(:one)
  end

  test "visiting the index" do
    visit meal_preps_url
    assert_selector "h1", text: "Meal preps"
  end

  test "should create meal prep" do
    visit meal_preps_url
    click_on "New meal prep"

    fill_in "Meal date", with: @meal_prep.meal_date
    fill_in "Meal type", with: @meal_prep.meal_type
    fill_in "Recipes", with: @meal_prep.recipes_id
    fill_in "Users", with: @meal_prep.users_id
    click_on "Create Meal prep"

    assert_text "Meal prep was successfully created"
    click_on "Back"
  end

  test "should update Meal prep" do
    visit meal_prep_url(@meal_prep)
    click_on "Edit this meal prep", match: :first

    fill_in "Meal date", with: @meal_prep.meal_date
    fill_in "Meal type", with: @meal_prep.meal_type
    fill_in "Recipes", with: @meal_prep.recipes_id
    fill_in "Users", with: @meal_prep.users_id
    click_on "Update Meal prep"

    assert_text "Meal prep was successfully updated"
    click_on "Back"
  end

  test "should destroy Meal prep" do
    visit meal_prep_url(@meal_prep)
    click_on "Destroy this meal prep", match: :first

    assert_text "Meal prep was successfully destroyed"
  end
end
