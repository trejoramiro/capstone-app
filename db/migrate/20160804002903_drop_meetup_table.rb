class DropMeetupTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :meetups
  end
end
