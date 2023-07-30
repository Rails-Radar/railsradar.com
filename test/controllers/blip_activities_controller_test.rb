require "test_helper"

class BlipActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blip_activity = blip_activities(:one)
  end

  test "should get index" do
    get blip_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_blip_activity_url
    assert_response :success
  end

  test "should create blip_activity" do
    assert_difference("BlipActivity.count") do
      post blip_activities_url, params: { blip_activity: { blip_id: @blip_activity.blip_id, comments: @blip_activity.comments, event: @blip_activity.event, stage: @blip_activity.stage, team_id: @blip_activity.team_id, user_id: @blip_activity.user_id } }
    end

    assert_redirected_to blip_activity_url(BlipActivity.last)
  end

  test "should show blip_activity" do
    get blip_activity_url(@blip_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_blip_activity_url(@blip_activity)
    assert_response :success
  end

  test "should update blip_activity" do
    patch blip_activity_url(@blip_activity), params: { blip_activity: { blip_id: @blip_activity.blip_id, comments: @blip_activity.comments, event: @blip_activity.event, stage: @blip_activity.stage, team_id: @blip_activity.team_id, user_id: @blip_activity.user_id } }
    assert_redirected_to blip_activity_url(@blip_activity)
  end

  test "should destroy blip_activity" do
    assert_difference("BlipActivity.count", -1) do
      delete blip_activity_url(@blip_activity)
    end

    assert_redirected_to blip_activities_url
  end
end
