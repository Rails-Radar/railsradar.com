# frozen_string_literal: true

class PanelComponent < ViewComponent::Base
  def initialize(bg_color: 'white')
    @bg_color = bg_color
  end
end
