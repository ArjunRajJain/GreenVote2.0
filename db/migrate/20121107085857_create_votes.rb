class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.decimal :amount
      t.decimal :room_id
      t.decimal :user_id
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
