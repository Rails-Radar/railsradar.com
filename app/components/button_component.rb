# app/components/button_component.rb
class ButtonComponent < ViewComponent::Base
  def initialize(text:, variant: 'default', theme: 'light', arrow: false, link: nil)
    @text = text
    @variant = variant.to_sym
    @theme = theme.to_sym
    @arrow = arrow
    @link = link
  end

  def call
    if @link
      link_to_button
    else
      regular_button
    end
  end

  private

  def link_to_button
    link_to(@link, class: link_classes) do
      button_content
    end
  end

  def regular_button
    button_tag(class: button_classes, type: 'button') do
      button_content
    end
  end

  def button_content
    if @arrow
      "#{@text} #{arrow_icon}".html_safe
    else
      @text
    end
  end

  def button_classes
    classes = 'inline-flex items-center rounded-md px-3 py-2 text-sm font-semibold'
    classes += " #{theme_class}" + " #{variant_class}" # Add theme and variant classes
    classes
  end

  def link_classes
    classes = 'underline'
    classes += " #{theme_class}" + " #{variant_class}" # Add theme and variant classes
    classes += ' inline-flex items-center' if @arrow
    classes
  end

  def theme_class
    @theme == :dark ? 'text-white' : 'text-gray-900'
  end

  def variant_class
    case @variant
    when :default
      'bg-white hover:bg-gray-50 focus:bg-gray-100'
    when :secondary
      @theme == :dark ? 'bg-indigo-700 hover:bg-indigo-800 focus:bg-indigo-800' : 'bg-indigo-600 hover:bg-indigo-700 focus:bg-indigo-700'
    when :link
      @theme == :dark ? 'text-indigo-400 hover:text-indigo-500' : 'text-blue-500 hover:text-blue-700'
    when :link_with_arrow
      @theme == :dark ? 'text-indigo-400 hover:text-indigo-500' : 'text-blue-500 hover:text-blue-700'
    else
      raise ArgumentError, "Invalid button variant: #{@variant}"
    end
  end

  def arrow_icon
    # I was going to use an SVG but this works better
    '->'
  end
end
