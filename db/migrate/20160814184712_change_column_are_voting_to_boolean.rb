class ChangeColumnAreVotingToBoolean < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :are_voting, 'boolean USING CAST(are_voting AS boolean)'
  end
end
