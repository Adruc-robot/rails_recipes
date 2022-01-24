require "application_system_test_case"

class StatesTest < ApplicationSystemTestCase
  setup do
    @state = states(:one)
  end

  test "visiting the index" do
    visit states_url
    assert_selector "h1", text: "States"
  end

  test "should create state" do
    visit states_url
    click_on "New state"

    check "Global" if @state.global
    fill_in "Name", with: @state.name
    fill_in "The key", with: @state.the_key
    fill_in "User id integer", with: @state.user_id_integer
    click_on "Create State"

    assert_text "State was successfully created"
    click_on "Back"
  end

  test "should update State" do
    visit state_url(@state)
    click_on "Edit this state", match: :first

    check "Global" if @state.global
    fill_in "Name", with: @state.name
    fill_in "The key", with: @state.the_key
    fill_in "User id integer", with: @state.user_id_integer
    click_on "Update State"

    assert_text "State was successfully updated"
    click_on "Back"
  end

  test "should destroy State" do
    visit state_url(@state)
    click_on "Destroy this state", match: :first

    assert_text "State was successfully destroyed"
  end
end
