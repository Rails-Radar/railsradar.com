# frozen_string_literal: true

require 'application_system_test_case'

class InterestingThingsTest < ApplicationSystemTestCase
  setup do
    @interesting_thing = interesting_things(:one)
  end

  test 'visiting the index' do
    visit interesting_things_url
    assert_selector 'h1', text: 'Interesting things'
  end

  test 'should create interesting thing' do
    visit interesting_things_url
    click_on 'New interesting thing'

    fill_in 'Description', with: @interesting_thing.description
    fill_in 'Kind', with: @interesting_thing.kind
    fill_in 'Name', with: @interesting_thing.name
    fill_in 'Team', with: @interesting_thing.team_id
    click_on 'Create Interesting thing'

    assert_text 'Interesting thing was successfully created'
    click_on 'Back'
  end

  test 'should update Interesting thing' do
    visit interesting_thing_url(@interesting_thing)
    click_on 'Edit this interesting thing', match: :first

    fill_in 'Description', with: @interesting_thing.description
    fill_in 'Kind', with: @interesting_thing.kind
    fill_in 'Name', with: @interesting_thing.name
    fill_in 'Team', with: @interesting_thing.team_id
    click_on 'Update Interesting thing'

    assert_text 'Interesting thing was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Interesting thing' do
    visit interesting_thing_url(@interesting_thing)
    click_on 'Destroy this interesting thing', match: :first

    assert_text 'Interesting thing was successfully destroyed'
  end
end
