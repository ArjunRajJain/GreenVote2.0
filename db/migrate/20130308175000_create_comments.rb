class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :building
      t.belongs_to :room
      t.text :content

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :building_id
    add_index :comments, :room_id
  end
end
