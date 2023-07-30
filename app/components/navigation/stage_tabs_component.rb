# frozen_string_literal: true

class Navigation::StageTabsComponent < ViewComponent::Base
  def before_render
    @path = request.path

    @items = [
      {
        name: 'Techniques',
        path: path_helper(request.original_fullpath, { kind: 'technique' }),
        active: @path == path_helper(request.original_fullpath, { kind: 'technique' })
      },
      {
        name: 'Tools',
        path: path_helper(request.original_fullpath, { kind: 'tool' }),
        active: @path == path_helper(request.original_fullpath, { kind: 'tool' })
      },
      {
        name: 'Gems',
        path: path_helper(request.original_fullpath, { kind: 'gem' }),
        active: @path == path_helper(request.original_fullpath, { kind: 'gem' })
      },
      {
        name: 'Platforms',
        path: path_helper(request.original_fullpath, { kind: 'platform' }),
        active: @path == path_helper(request.original_fullpath, { kind: 'platform' })
      }
    ]
  end

  def path_helper(path, options = {})
    case path
    when '/team'
      my_team_path(options)
    when '/'
      root_path(options)
    end
  end
end
