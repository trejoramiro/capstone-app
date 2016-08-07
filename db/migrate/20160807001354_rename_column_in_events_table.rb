class RenameColumnInEventsTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :restaurant_id, :venue_id
    rename_column :votes, :restaurant_id, :venue_id
  end
end
