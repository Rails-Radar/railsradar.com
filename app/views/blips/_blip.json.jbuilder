# frozen_string_literal: true

json.extract! blip, :id, :interesting_thing_id, :team_id, :stage, :created_at, :updated_at
json.url blip_url(blip, format: :json)
