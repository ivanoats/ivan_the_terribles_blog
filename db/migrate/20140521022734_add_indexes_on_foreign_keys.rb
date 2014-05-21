class AddIndexesOnForeignKeys < ActiveRecord::Migration
  def up
    add_index :comments, :post_id
    add_index :replies,  :comment_id
  end

  def down
    remove_index :comments, :post_id
    remove_index :replies,  :comment_id
  end
end
