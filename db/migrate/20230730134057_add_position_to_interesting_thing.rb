class AddPositionToInterestingThing < ActiveRecord::Migration[7.0]
  def change
    add_column :interesting_things, :position, :float
  end
end
