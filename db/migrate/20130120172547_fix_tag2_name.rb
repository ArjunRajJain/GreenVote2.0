class FixTag2Name < ActiveRecord::Migration
  def change
  	rename_column :buildings, :tagId, :tagid
  end
end
