class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.boolean :chosen
      t.integer :group_id

      t.timestamps
    end
  end
end
