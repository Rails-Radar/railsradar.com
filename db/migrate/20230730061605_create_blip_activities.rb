class CreateBlipActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :blip_activities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.string :blip_references
      t.integer :stage
      t.text :comments

      t.timestamps
    end
  end
end
