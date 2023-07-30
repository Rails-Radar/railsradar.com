# frozen_string_literal: true

class HeroComponent < ViewComponent::Base
  def initialize(title:, subtitle:, background:, cta:)
    @title = title
    @subtitle = subtitle
    @background = background
    @cta = cta
  end

end
