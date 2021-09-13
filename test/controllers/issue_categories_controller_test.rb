require 'test_helper'

class IssueCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get issue_categories_index_url
    assert_response :success
  end

  test "should get new" do
    get issue_categories_new_url
    assert_response :success
  end

  test "should get edit" do
    get issue_categories_edit_url
    assert_response :success
  end

  test "should get create" do
    get issue_categories_create_url
    assert_response :success
  end

  test "should get update" do
    get issue_categories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get issue_categories_destroy_url
    assert_response :success
  end

end
