class AddDateTypeToEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :date, :string
    add_column :events, :date, :date
  end
end
