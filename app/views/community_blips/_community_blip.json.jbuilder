json.extract! community_blip, :id, :name, :description, :stage, :group, :created_at, :updated_at
json.url community_blip_url(community_blip, format: :json)
