# app/components/cta_component.rb
class CtaComponent < ViewComponent::Base
  def initialize(title:, subtitle:, buttons:, image_url: nil)
    @title = title
    @subtitle = subtitle
    @buttons = buttons
    @image_url = image_url
  end
end
