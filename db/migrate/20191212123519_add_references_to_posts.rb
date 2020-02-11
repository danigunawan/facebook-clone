class AddReferencesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :references, :integer
  end
end
