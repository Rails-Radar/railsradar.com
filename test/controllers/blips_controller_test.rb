# frozen_string_literal: true

require 'test_helper'

class BlipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blip = blips(:one)
  end

  test 'should get index' do
    get blips_url
    assert_response :success
  end

  test 'should get new' do
    get new_blip_url
    assert_response :success
  end

  test 'should create blip' do
    assert_difference('Blip.count') do
      post blips_url,
           params: { blip: { interesting_thing_id: @blip.interesting_thing_id, stage: @blip.stage,
                             team_id: @blip.team_id } }
    end

    assert_redirected_to blip_url(Blip.last)
  end

  test 'should show blip' do
    get blip_url(@blip)
    assert_response :success
  end

  test 'should get edit' do
    get edit_blip_url(@blip)
    assert_response :success
  end

  test 'should update blip' do
    patch blip_url(@blip),
          params: { blip: { interesting_thing_id: @blip.interesting_thing_id, stage: @blip.stage,
                            team_id: @blip.team_id } }
    assert_redirected_to blip_url(@blip)
  end

  test 'should destroy blip' do
    assert_difference('Blip.count', -1) do
      delete blip_url(@blip)
    end

    assert_redirected_to blips_url
  end
end
