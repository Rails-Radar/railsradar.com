require "test_helper"

class CommunityBlipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_blip = community_blips(:one)
  end

  test "should get index" do
    get community_blips_url
    assert_response :success
  end

  test "should get new" do
    get new_community_blip_url
    assert_response :success
  end

  test "should create community_blip" do
    assert_difference("CommunityBlip.count") do
      post community_blips_url, params: { community_blip: { description: @community_blip.description, group: @community_blip.group, name: @community_blip.name, stage: @community_blip.stage } }
    end

    assert_redirected_to community_blip_url(CommunityBlip.last)
  end

  test "should show community_blip" do
    get community_blip_url(@community_blip)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_blip_url(@community_blip)
    assert_response :success
  end

  test "should update community_blip" do
    patch community_blip_url(@community_blip), params: { community_blip: { description: @community_blip.description, group: @community_blip.group, name: @community_blip.name, stage: @community_blip.stage } }
    assert_redirected_to community_blip_url(@community_blip)
  end

  test "should destroy community_blip" do
    assert_difference("CommunityBlip.count", -1) do
      delete community_blip_url(@community_blip)
    end

    assert_redirected_to community_blips_url
  end
end
