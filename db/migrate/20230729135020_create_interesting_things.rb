# frozen_string_literal: true

class CreateInterestingThings < ActiveRecord::Migration[7.0]
  def change
    create_table :interesting_things do |t|
      t.string :name
      t.text :description
      t.integer :kind
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
