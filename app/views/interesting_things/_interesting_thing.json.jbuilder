# frozen_string_literal: true

json.extract! interesting_thing, :id, :name, :description, :kind, :team_id, :created_at, :updated_at
json.url interesting_thing_url(interesting_thing, format: :json)
