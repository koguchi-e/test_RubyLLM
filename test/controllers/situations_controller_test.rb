require "test_helper"

class SituationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get situations_index_url
    assert_response :success
  end

  test "should get show" do
    get situations_show_url
    assert_response :success
  end

  test "should get new" do
    get situations_new_url
    assert_response :success
  end

  test "should get create" do
    get situations_create_url
    assert_response :success
  end
end
