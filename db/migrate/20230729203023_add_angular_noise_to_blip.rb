class AddAngularNoiseToBlip < ActiveRecord::Migration[7.0]
  def change
    add_column :blips, :angular_noise, :float
  end
end
