# frozen_string_literal: true

class FullRadarComponent < ViewComponent::Base
  def initialize(blips:)
    @blips = blips
  end

end
