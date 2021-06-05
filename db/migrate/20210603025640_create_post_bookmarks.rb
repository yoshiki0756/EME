class CreatePostBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :post_bookmarks do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
      
      drop_table :post_bookmarks
    end
  end
end
