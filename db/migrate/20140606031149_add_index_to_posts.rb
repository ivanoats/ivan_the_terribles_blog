class AddIndexToPosts < ActiveRecord::Migration
  def change
     add_index "posts", ["created_at"], :name => "index_posts_on_created_at"
  end
end
