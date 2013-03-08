class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.decimal :temp

      t.timestamps
    end
  end
end
