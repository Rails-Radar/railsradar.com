# frozen_string_literal: true

class Blip < ApplicationRecord
  belongs_to :interesting_thing
  belongs_to :team
  enum :stage, { adopt: 0, trial: 1, assess: 2, hold: 3 }, prefix: true

  validates :radial_noise, presence: true
  validates :angular_noise, presence: true

end
