require "test_helper"

class CommunityControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get community_index_url
    assert_response :success
  end

  test "should get show" do
    get community_show_url
    assert_response :success
  end
end
