class CreateBlipActivities < ActiveRecord::Migration[7.0]
  def change
    drop_table :blip_activities, if_exists: true
    create_table :blip_activities do |t|
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :blip, null: false, foreign_key: true
      t.integer :stage
      t.integer :event
      t.text :comments

      t.timestamps
    end
  end
end
