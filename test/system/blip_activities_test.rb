require "application_system_test_case"

class BlipActivitiesTest < ApplicationSystemTestCase
  setup do
    @blip_activity = blip_activities(:one)
  end

  test "visiting the index" do
    visit blip_activities_url
    assert_selector "h1", text: "Blip activities"
  end

  test "should create blip activity" do
    visit blip_activities_url
    click_on "New blip activity"

    fill_in "Blip", with: @blip_activity.blip_id
    fill_in "Comments", with: @blip_activity.comments
    fill_in "Event", with: @blip_activity.event
    fill_in "Stage", with: @blip_activity.stage
    fill_in "Team", with: @blip_activity.team_id
    fill_in "User", with: @blip_activity.user_id
    click_on "Create Blip activity"

    assert_text "Blip activity was successfully created"
    click_on "Back"
  end

  test "should update Blip activity" do
    visit blip_activity_url(@blip_activity)
    click_on "Edit this blip activity", match: :first

    fill_in "Blip", with: @blip_activity.blip_id
    fill_in "Comments", with: @blip_activity.comments
    fill_in "Event", with: @blip_activity.event
    fill_in "Stage", with: @blip_activity.stage
    fill_in "Team", with: @blip_activity.team_id
    fill_in "User", with: @blip_activity.user_id
    click_on "Update Blip activity"

    assert_text "Blip activity was successfully updated"
    click_on "Back"
  end

  test "should destroy Blip activity" do
    visit blip_activity_url(@blip_activity)
    click_on "Destroy this blip activity", match: :first

    assert_text "Blip activity was successfully destroyed"
  end
end
