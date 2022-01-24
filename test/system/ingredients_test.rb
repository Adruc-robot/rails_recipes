require "application_system_test_case"

class IngredientsTest < ApplicationSystemTestCase
  setup do
    @ingredient = ingredients(:one)
  end

  test "visiting the index" do
    visit ingredients_url
    assert_selector "h1", text: "Ingredients"
  end

  test "should create ingredient" do
    visit ingredients_url
    click_on "New ingredient"

    check "Global" if @ingredient.global
    fill_in "Name", with: @ingredient.name
    fill_in "The key", with: @ingredient.the_key
    fill_in "User", with: @ingredient.user_id
    click_on "Create Ingredient"

    assert_text "Ingredient was successfully created"
    click_on "Back"
  end

  test "should update Ingredient" do
    visit ingredient_url(@ingredient)
    click_on "Edit this ingredient", match: :first

    check "Global" if @ingredient.global
    fill_in "Name", with: @ingredient.name
    fill_in "The key", with: @ingredient.the_key
    fill_in "User", with: @ingredient.user_id
    click_on "Update Ingredient"

    assert_text "Ingredient was successfully updated"
    click_on "Back"
  end

  test "should destroy Ingredient" do
    visit ingredient_url(@ingredient)
    click_on "Destroy this ingredient", match: :first

    assert_text "Ingredient was successfully destroyed"
  end
end
