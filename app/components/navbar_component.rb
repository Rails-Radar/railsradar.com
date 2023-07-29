# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  def before_render
    @path = request.path

    @items = [
      {
        text: 'Teams',
        path: teams_path,
        active: @path == teams_path
      }
    ]
  end

  def initialize(current_user: nil)
    super
    @current_user = current_user
  end
end
