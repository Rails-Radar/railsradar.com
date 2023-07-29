require "application_system_test_case"

class CommunityBlipsTest < ApplicationSystemTestCase
  setup do
    @community_blip = community_blips(:one)
  end

  test "visiting the index" do
    visit community_blips_url
    assert_selector "h1", text: "Community blips"
  end

  test "should create community blip" do
    visit community_blips_url
    click_on "New community blip"

    fill_in "Description", with: @community_blip.description
    fill_in "Group", with: @community_blip.group
    fill_in "Name", with: @community_blip.name
    fill_in "Stage", with: @community_blip.stage
    click_on "Create Community blip"

    assert_text "Community blip was successfully created"
    click_on "Back"
  end

  test "should update Community blip" do
    visit community_blip_url(@community_blip)
    click_on "Edit this community blip", match: :first

    fill_in "Description", with: @community_blip.description
    fill_in "Group", with: @community_blip.group
    fill_in "Name", with: @community_blip.name
    fill_in "Stage", with: @community_blip.stage
    click_on "Update Community blip"

    assert_text "Community blip was successfully updated"
    click_on "Back"
  end

  test "should destroy Community blip" do
    visit community_blip_url(@community_blip)
    click_on "Destroy this community blip", match: :first

    assert_text "Community blip was successfully destroyed"
  end
end
