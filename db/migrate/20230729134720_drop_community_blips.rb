# frozen_string_literal: true

class DropCommunityBlips < ActiveRecord::Migration[7.0]
  def change
    drop_table :community_blips, if_exists: true

  end
end
