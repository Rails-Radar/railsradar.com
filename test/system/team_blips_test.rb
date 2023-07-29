require "application_system_test_case"

class TeamBlipsTest < ApplicationSystemTestCase
  setup do
    @team_blip = team_blips(:one)
  end

  test "visiting the index" do
    visit team_blips_url
    assert_selector "h1", text: "Team blips"
  end

  test "should create team blip" do
    visit team_blips_url
    click_on "New team blip"

    fill_in "Community blip", with: @team_blip.community_blip_id
    fill_in "Description", with: @team_blip.description
    fill_in "Group", with: @team_blip.group
    fill_in "Name", with: @team_blip.name
    fill_in "Stage", with: @team_blip.stage
    fill_in "Team", with: @team_blip.team_id
    click_on "Create Team blip"

    assert_text "Team blip was successfully created"
    click_on "Back"
  end

  test "should update Team blip" do
    visit team_blip_url(@team_blip)
    click_on "Edit this team blip", match: :first

    fill_in "Community blip", with: @team_blip.community_blip_id
    fill_in "Description", with: @team_blip.description
    fill_in "Group", with: @team_blip.group
    fill_in "Name", with: @team_blip.name
    fill_in "Stage", with: @team_blip.stage
    fill_in "Team", with: @team_blip.team_id
    click_on "Update Team blip"

    assert_text "Team blip was successfully updated"
    click_on "Back"
  end

  test "should destroy Team blip" do
    visit team_blip_url(@team_blip)
    click_on "Destroy this team blip", match: :first

    assert_text "Team blip was successfully destroyed"
  end
end
