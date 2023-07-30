# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :blips

  has_many :team_users
end
