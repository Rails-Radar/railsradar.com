# frozen_string_literal: true

class CreateBlips < ActiveRecord::Migration[7.0]
  def change
    create_table :blips do |t|
      t.references :interesting_thing, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.integer :stage

      t.timestamps
    end
  end
end
