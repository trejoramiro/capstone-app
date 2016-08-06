class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :restaurant_id
      t.string :name
      t.integer :capacity
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.integer :group_id

      t.timestamps
    end
  end
end
