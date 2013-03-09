class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.belongs_to :room
      t.text :content

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :room_id
  end
end
