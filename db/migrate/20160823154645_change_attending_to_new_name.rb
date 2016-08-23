class ChangeAttendingToNewName < ActiveRecord::Migration
  def change
  	rename_table(:attending, :events_users)
  end
end
