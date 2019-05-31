class AddRaIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :ra_id, :bigint
  end
end
