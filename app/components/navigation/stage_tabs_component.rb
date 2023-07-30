# frozen_string_literal: true

class Navigation::StageTabsComponent < ViewComponent::Base
  def before_render
    @path = request.path

    @items = [
      {
        name: 'All',
        path: community_path,
        active: @path == community_path
      },
      {
        name: 'Techniques',
        path: community_path(kind: 'technique'),
        active: @path == community_path(kind: 'technique')
      },
      {
        name: 'Tools',
        path: community_path(kind: 'tool'),
        active: @path == community_path(kind: 'tool')
      },
      {
        name: 'Gems',
        path: community_path(kind: 'gem'),
        active: @path == community_path(kind: 'gem')
      },
      {
        name: 'Platforms',
        path: community_path(kind: 'platform'),
        active: @path == community_path(kind: 'platform')
      }
    ]
  end

  def initialize(current_user: nil)
    super
    @current_user = current_user
  end
end
