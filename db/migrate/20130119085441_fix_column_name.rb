class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :buildings, :name, :address
  end
end
