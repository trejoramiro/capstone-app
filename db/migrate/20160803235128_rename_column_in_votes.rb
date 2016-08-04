class RenameColumnInVotes < ActiveRecord::Migration[5.0]
  def change
    rename_column :votes, :rest_id, :restaurant_id
  end
end
