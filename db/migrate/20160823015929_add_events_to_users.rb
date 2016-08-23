class AddEventsToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :events, index: true, foreign_key: true, column: :attending
  end
end
