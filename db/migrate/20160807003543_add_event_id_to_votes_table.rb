class AddEventIdToVotesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :event_id, :integer
  end
end
