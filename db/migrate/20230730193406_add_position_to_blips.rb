class AddPositionToBlips < ActiveRecord::Migration[7.0]
  def change
    add_column :blips, :position, :integer
  end
end
