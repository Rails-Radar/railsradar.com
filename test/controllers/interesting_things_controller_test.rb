# frozen_string_literal: true

require 'test_helper'

class InterestingThingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interesting_thing = interesting_things(:one)
  end

  test 'should get index' do
    get interesting_things_url
    assert_response :success
  end

  test 'should get new' do
    get new_interesting_thing_url
    assert_response :success
  end

  test 'should create interesting_thing' do
    assert_difference('InterestingThing.count') do
      post interesting_things_url,
           params: { interesting_thing: { description: @interesting_thing.description, kind: @interesting_thing.kind,
                                          name: @interesting_thing.name, team_id: @interesting_thing.team_id } }
    end

    assert_redirected_to interesting_thing_url(InterestingThing.last)
  end

  test 'should show interesting_thing' do
    get interesting_thing_url(@interesting_thing)
    assert_response :success
  end

  test 'should get edit' do
    get edit_interesting_thing_url(@interesting_thing)
    assert_response :success
  end

  test 'should update interesting_thing' do
    patch interesting_thing_url(@interesting_thing),
          params: { interesting_thing: { description: @interesting_thing.description, kind: @interesting_thing.kind,
                                         name: @interesting_thing.name, team_id: @interesting_thing.team_id } }
    assert_redirected_to interesting_thing_url(@interesting_thing)
  end

  test 'should destroy interesting_thing' do
    assert_difference('InterestingThing.count', -1) do
      delete interesting_thing_url(@interesting_thing)
    end

    assert_redirected_to interesting_things_url
  end
end
