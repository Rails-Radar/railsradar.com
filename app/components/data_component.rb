# frozen_string_literal: true

class DataComponent < ViewComponent::Base
  def initialize(title:, subtitle:, datapoints:)
    @title = title
    @subtitle = subtitle
    @datapoints = datapoints
  end
end
