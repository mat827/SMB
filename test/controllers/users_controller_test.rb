require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get edit_withdraw" do
    get users_edit_withdraw_url
    assert_response :success
  end

  test "should get withdraw" do
    get users_withdraw_url
    assert_response :success
  end

  test "should get favorite_stretchs" do
    get users_favorite_stretchs_url
    assert_response :success
  end

end
