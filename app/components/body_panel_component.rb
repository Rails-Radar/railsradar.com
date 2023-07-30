# frozen_string_literal: true

class BodyPanelComponent < ViewComponent::Base
  def initialize(notice:)
    @notice = notice
  end
end
