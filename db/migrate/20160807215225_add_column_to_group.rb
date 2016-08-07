class AddColumnToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :longitude, :integer
    add_column :groups, :latitude, :integer
  end
end
