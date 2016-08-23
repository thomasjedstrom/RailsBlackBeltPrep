class AddLocationToUser < ActiveRecord::Migration
  def change
  	add_reference :users, :state, foreign_key: true
  end
end
