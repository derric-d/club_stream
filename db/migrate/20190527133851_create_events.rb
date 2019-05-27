class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
