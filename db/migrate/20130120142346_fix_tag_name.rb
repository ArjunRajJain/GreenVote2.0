class FixTagName < ActiveRecord::Migration
  def change
  	rename_column :buildings, :tagid, :tagId
  end
end
