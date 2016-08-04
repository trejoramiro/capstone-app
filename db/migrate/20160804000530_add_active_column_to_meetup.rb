class AddActiveColumnToMeetup < ActiveRecord::Migration[5.0]
  def change
    add_column :meetups, :active, :boolean
  end
end
