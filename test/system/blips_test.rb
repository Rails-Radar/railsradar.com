# frozen_string_literal: true

require 'application_system_test_case'

class BlipsTest < ApplicationSystemTestCase
  setup do
    @blip = blips(:one)
  end

  test 'visiting the index' do
    visit blips_url
    assert_selector 'h1', text: 'Blips'
  end

  test 'should create blip' do
    visit blips_url
    click_on 'New blip'

    fill_in 'Interesting thing', with: @blip.interesting_thing_id
    fill_in 'Stage', with: @blip.stage
    fill_in 'Team', with: @blip.team_id
    click_on 'Create Blip'

    assert_text 'Blip was successfully created'
    click_on 'Back'
  end

  test 'should update Blip' do
    visit blip_url(@blip)
    click_on 'Edit this blip', match: :first

    fill_in 'Interesting thing', with: @blip.interesting_thing_id
    fill_in 'Stage', with: @blip.stage
    fill_in 'Team', with: @blip.team_id
    click_on 'Update Blip'

    assert_text 'Blip was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Blip' do
    visit blip_url(@blip)
    click_on 'Destroy this blip', match: :first

    assert_text 'Blip was successfully destroyed'
  end
end
