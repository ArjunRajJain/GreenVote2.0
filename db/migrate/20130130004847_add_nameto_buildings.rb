class AddNametoBuildings < ActiveRecord::Migration
	def up
  	add_column :buildings, :name, :string
  end

  def down

  end
end