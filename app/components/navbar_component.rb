# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  def before_render
    @path = request.path

    @items = [
      {
        name: 'Community',
        path: community_path,
        active: @path == community_path
      },
      # {
      #   name: 'Team',
      #   path: team_path,
      #   active: @path == team_path
      # },
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
