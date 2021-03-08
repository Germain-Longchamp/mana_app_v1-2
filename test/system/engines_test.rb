require "application_system_test_case"

class EnginesTest < ApplicationSystemTestCase
  setup do
    @engine = engines(:one)
  end

  test "visiting the index" do
    visit engines_url
    assert_selector "h1", text: "Engines"
  end

  test "creating a Engine" do
    visit engines_url
    click_on "New Engine"

    fill_in "Description", with: @engine.description
    fill_in "Name", with: @engine.name
    click_on "Create Engine"

    assert_text "Engine was successfully created"
    click_on "Back"
  end

  test "updating a Engine" do
    visit engines_url
    click_on "Edit", match: :first

    fill_in "Description", with: @engine.description
    fill_in "Name", with: @engine.name
    click_on "Update Engine"

    assert_text "Engine was successfully updated"
    click_on "Back"
  end

  test "destroying a Engine" do
    visit engines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Engine was successfully destroyed"
  end
end
