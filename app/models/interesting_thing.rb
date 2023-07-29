# frozen_string_literal: true

class InterestingThing < ApplicationRecord
  belongs_to :team
  enum :kind, { tool: 0, technique: 1, gem: 2, infrastructure: 3 }, prefix: true, scopes: false

end
