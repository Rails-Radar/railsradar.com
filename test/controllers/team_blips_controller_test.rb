require "test_helper"

class TeamBlipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_blip = team_blips(:one)
  end

  test "should get index" do
    get team_blips_url
    assert_response :success
  end

  test "should get new" do
    get new_team_blip_url
    assert_response :success
  end

  test "should create team_blip" do
    assert_difference("TeamBlip.count") do
      post team_blips_url, params: { team_blip: { community_blip_id: @team_blip.community_blip_id, description: @team_blip.description, group: @team_blip.group, name: @team_blip.name, stage: @team_blip.stage, team_id: @team_blip.team_id } }
    end

    assert_redirected_to team_blip_url(TeamBlip.last)
  end

  test "should show team_blip" do
    get team_blip_url(@team_blip)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_blip_url(@team_blip)
    assert_response :success
  end

  test "should update team_blip" do
    patch team_blip_url(@team_blip), params: { team_blip: { community_blip_id: @team_blip.community_blip_id, description: @team_blip.description, group: @team_blip.group, name: @team_blip.name, stage: @team_blip.stage, team_id: @team_blip.team_id } }
    assert_redirected_to team_blip_url(@team_blip)
  end

  test "should destroy team_blip" do
    assert_difference("TeamBlip.count", -1) do
      delete team_blip_url(@team_blip)
    end

    assert_redirected_to team_blips_url
  end
end
