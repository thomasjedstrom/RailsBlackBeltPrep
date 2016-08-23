class RemoveEventFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :events_id
  end
end
