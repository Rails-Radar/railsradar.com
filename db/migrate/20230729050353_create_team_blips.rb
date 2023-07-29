class CreateTeamBlips < ActiveRecord::Migration[7.0]
  def change
    create_table :team_blips do |t|
      t.references :team, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :stage
      t.string :group
      t.references :community_blip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
