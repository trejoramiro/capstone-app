class ChangeDataTypeColumnsInVenues < ActiveRecord::Migration[5.0]
  def change
    change_column :venues, :lng, :string
    change_column :venues, :lat, :string
  end
end
