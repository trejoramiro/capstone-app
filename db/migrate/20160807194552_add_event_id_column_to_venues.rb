class AddEventIdColumnToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :event_id, :integer
  end
end
