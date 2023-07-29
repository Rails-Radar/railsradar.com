# frozen_string_literal: true

class Blip < ApplicationRecord
  belongs_to :interesting_thing
  belongs_to :team
end
