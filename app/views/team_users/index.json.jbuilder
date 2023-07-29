# frozen_string_literal: true

json.array! @team_users, partial: 'team_users/team_user', as: :team_user
