class CreateAddlongitudetobuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :longitude, :float
    add_column :buildings, :latitude, :float
  end
end
