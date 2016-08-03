class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :location
      t.string :vote_status

      t.timestamps
    end
  end
end
