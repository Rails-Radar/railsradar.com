class BlipActivity < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :blip

  enum :stage, { adopt: 0, trial: 1, assess: 2, hold: 3 }, prefix: true
  enum :event, { spotted: 0, promoted: 1, demoted: 2, supported: 3 }, prefix: true
end
