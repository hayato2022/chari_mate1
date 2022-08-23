class ChangeCloumnsNotnullAddPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :user_id, :integer, null: false
    change_column :posts, :tag_id, :integer, null: false
  end
end
