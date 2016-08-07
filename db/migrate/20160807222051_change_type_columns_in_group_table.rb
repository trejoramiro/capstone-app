class ChangeTypeColumnsInGroupTable < ActiveRecord::Migration[5.0]
  def change
    change_column :groups, :longitude, :decimal, precision:9, scale: 7
    change_column :groups, :latitude, :decimal, precision:9, scale: 7

  end
end
