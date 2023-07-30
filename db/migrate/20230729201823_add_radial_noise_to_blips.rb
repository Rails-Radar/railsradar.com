class AddRadialNoiseToBlips < ActiveRecord::Migration[7.0]
  def change
    add_column :blips, :radial_noise, :float
  end
end
