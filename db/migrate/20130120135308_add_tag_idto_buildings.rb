class AddTagIdtoBuildings < ActiveRecord::Migration
  def up
  	add_column :buildings, :tagid, :decimal
  end

  def down

  end
end
