class AddShorturlToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :Shorturl, :string
  end
end
