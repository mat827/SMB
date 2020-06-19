require 'test_helper'

class StretchsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stretchs_index_url
    assert_response :success
  end

  test "should get show" do
    get stretchs_show_url
    assert_response :success
  end

end
