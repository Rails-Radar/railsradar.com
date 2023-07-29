class AddInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :nickname, :string
    add_column :users, :profile_url, :string
  end
end
