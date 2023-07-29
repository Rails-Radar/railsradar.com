# frozen_string_literal: true

class AddIsCommunityToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :is_community, :boolean
  end
end
