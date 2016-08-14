class ChangeColumnStatusInEvents < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :status, :are_voting
  end
end
