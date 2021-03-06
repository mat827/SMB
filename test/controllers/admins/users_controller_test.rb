# frozen_string_literal: true

require 'test_helper'

class Admins::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admins_users_index_url
    assert_response :success
  end

  test 'should get show' do
    get admins_users_show_url
    assert_response :success
  end

  test 'should get edit' do
    get admins_users_edit_url
    assert_response :success
  end

  test 'should get edit_withdraw' do
    get admins_users_edit_withdraw_url
    assert_response :success
  end
end
