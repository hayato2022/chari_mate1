class RemoveTagIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :tag_id, :integer
  end
end
