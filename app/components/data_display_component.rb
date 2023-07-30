# frozen_string_literal: true

class DataDisplayComponent < ViewComponent::Base
  def initialize(title: nil, subtitle: nil, data: nil)
    @title = title
    @subtitle = subtitle
    @data = data
  end
end
