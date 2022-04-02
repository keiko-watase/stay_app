require "test_helper"

class ResavationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resavations_index_url
    assert_response :success
  end

  test "should get show" do
    get resavations_show_url
    assert_response :success
  end

  test "should get new" do
    get resavations_new_url
    assert_response :success
  end

  test "should get edit" do
    get resavations_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get resavations_destroy_url
    assert_response :success
  end
end
