# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  def before_render
    @path = request.path

    @items = [
      {
        name: 'Community',
        path: root_path,
        active: @path == root_path
      },
      {
        name: 'Teams',
        path: teams_path,
        active: @path == teams_path
      },
      {
        name: 'Interesting Things',
        path: interesting_things_path,
        active: @path == interesting_things_path
      }
    ]
  end

  def initialize(current_user: nil)
    super
    @current_user = current_user
  end
end
