class DropReferencesFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :references
  end
end
