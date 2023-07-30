# frozen_string_literal: true

class Navigation::CommunityTabsComponent < ViewComponent::Base
  def before_render
    @path = request.path

    @items = [
      {
        name: 'All',
        path: root_path,
        active: @path == root_path
      },
      {
        name: 'Techniques',
        path: root_path(kind: 'technique'),
        active: @path == root_path(kind: 'technique')
      },
      {
        name: 'Tools',
        path: root_path(kind: 'tool'),
        active: @path == root_path(kind: 'tool')
      },
      {
        name: 'Gems',
        path:  root_path(kind: 'gem'),
        active: @path ==  root_path(kind: 'gem')
      },
      {
        name: 'Platforms',
        path:  root_path(kind: 'platform'),
        active: @path ==  root_path(kind: 'platform')
      }
    ]
  end
end
