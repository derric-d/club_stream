class AddLineupToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :lineup, :string
  end
end
