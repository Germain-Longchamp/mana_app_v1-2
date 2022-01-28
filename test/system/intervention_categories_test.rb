require "application_system_test_case"

class InterventionCategoriesTest < ApplicationSystemTestCase
  setup do
    @intervention_category = intervention_categories(:one)
  end

  test "visiting the index" do
    visit intervention_categories_url
    assert_selector "h1", text: "Intervention Categories"
  end

  test "creating a Intervention category" do
    visit intervention_categories_url
    click_on "New Intervention Category"

    fill_in "Description", with: @intervention_category.description
    fill_in "Name", with: @intervention_category.name
    click_on "Create Intervention category"

    assert_text "Intervention category was successfully created"
    click_on "Back"
  end

  test "updating a Intervention category" do
    visit intervention_categories_url
    click_on "Edit", match: :first

    fill_in "Description", with: @intervention_category.description
    fill_in "Name", with: @intervention_category.name
    click_on "Update Intervention category"

    assert_text "Intervention category was successfully updated"
    click_on "Back"
  end

  test "destroying a Intervention category" do
    visit intervention_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Intervention category was successfully destroyed"
  end
end
