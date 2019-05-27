class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :string
    add_column :users, :city, :string
    add_column :users, :image_url, :string
  end
end
