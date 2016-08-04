class AddGroupIdColumnToVote < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :group_id, :integer
  end
end
