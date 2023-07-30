# frozen_string_literal: true

class NavButtonComponent < ViewComponent::Base

  def initialize(label, href)
    @label = label
    @href = href
  end

end
