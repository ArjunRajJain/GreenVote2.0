class AddBuildingIDtoRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :building_id, :decimal
  end
end

