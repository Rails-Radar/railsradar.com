class AddFieldToBlipActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :blip_activities, :event, :integer
  end
end
