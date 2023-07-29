class TeamBlip < ApplicationRecord
  belongs_to :team
  belongs_to :community_blip
end
