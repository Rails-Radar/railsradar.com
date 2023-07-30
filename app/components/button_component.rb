# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  VARIANTS = %w[default secondary].freeze

  def initialize(text:, variant: 'default')
    @variant = variant
    @text = text
  end

  def call
    tag.button(button_content, class: button_classes, type: 'button')
  end

  private

  def button_content
    @text
  end

  def button_classes
    case @variant
    when 'default'
      'inline-flex items-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50'
    when 'secondary'
      'ml-3 inline-flex items-center rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 bg-indigo-40'
    else
      raise ArgumentError, "Invalid button variant: #{@variant}"
    end
  end
end
