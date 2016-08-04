class AddColumnsToVisit < ActiveRecord::Migration[5.0]
  def change
    add_column :visits, :user_id, :integer
    add_column :visits, :group_id, :integer
    add_column :visits, :restaurant_id, :integer
    add_column :visits, :date, :datetime
    add_column :visits, :status, :string

  end
end
