# frozen_string_literal: true

class Navigation::TeamTabsComponent < ViewComponent::Base
  def before_render
    @path = request.original_fullpath

    @items = [
      {
        name: 'Techniques',
        path: my_team_path(kind: 'technique'),
        active: @path == my_team_path(kind: 'technique')
      },
      {
        name: 'Tools',
        path: my_team_path(kind: 'tool'),
        active: @path == my_team_path(kind: 'tool')
      },
      {
        name: 'Gems',
        path: my_team_path(kind: 'gem'),
        active: @path == my_team_path(kind: 'gem')
      },
      {
        name: 'Platforms',
        path: my_team_path(kind: 'platform'),
        active: @path == my_team_path(kind: 'platform')
      }
    ]
  end
end
