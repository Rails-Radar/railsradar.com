# frozen_string_literal: true

class DropTeamBlips < ActiveRecord::Migration[7.0]
  def change
    drop_table :team_blips
  end
end
