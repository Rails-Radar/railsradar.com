# frozen_string_literal: true

class HeaderPanelComponent < ViewComponent::Base
  def initialize(title:)
    @title = title
  end
end
