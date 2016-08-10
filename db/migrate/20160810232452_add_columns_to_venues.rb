class AddColumnsToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :lat, :decimal, precision: 9, scale: 7
    add_column :venues, :lng, :decimal, precision: 9, scale: 7
  end
end
