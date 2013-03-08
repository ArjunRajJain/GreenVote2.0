class AddBuildingIDtoVotes < ActiveRecord::Migration
  def change
    add_column :votes, :building_id, :decimal
  end
end

