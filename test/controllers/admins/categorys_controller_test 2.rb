# frozen_string_literal: true

require 'test_helper'

class Admins::CategorysControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admins_categorys_index_url
    assert_response :success
  end

  test 'should get edit' do
    get admins_categorys_edit_url
    assert_response :success
  end
end
