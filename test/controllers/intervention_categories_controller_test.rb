require 'test_helper'

class InterventionCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intervention_category = intervention_categories(:one)
  end

  test "should get index" do
    get intervention_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_intervention_category_url
    assert_response :success
  end

  test "should create intervention_category" do
    assert_difference('InterventionCategory.count') do
      post intervention_categories_url, params: { intervention_category: { description: @intervention_category.description, name: @intervention_category.name } }
    end

    assert_redirected_to intervention_category_url(InterventionCategory.last)
  end

  test "should show intervention_category" do
    get intervention_category_url(@intervention_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_intervention_category_url(@intervention_category)
    assert_response :success
  end

  test "should update intervention_category" do
    patch intervention_category_url(@intervention_category), params: { intervention_category: { description: @intervention_category.description, name: @intervention_category.name } }
    assert_redirected_to intervention_category_url(@intervention_category)
  end

  test "should destroy intervention_category" do
    assert_difference('InterventionCategory.count', -1) do
      delete intervention_category_url(@intervention_category)
    end

    assert_redirected_to intervention_categories_url
  end
end
