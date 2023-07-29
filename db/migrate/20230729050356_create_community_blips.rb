class CreateCommunityBlips < ActiveRecord::Migration[7.0]
  def change
    create_table :community_blips do |t|
      t.string :name
      t.text :description
      t.integer :stage
      t.integer :group

      t.timestamps
    end
  end
end
