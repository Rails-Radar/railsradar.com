json.extract! blip_activity, :id, :user_id, :team_id, :blip_id, :stage, :event, :comments, :created_at, :updated_at
json.url blip_activity_url(blip_activity, format: :json)
