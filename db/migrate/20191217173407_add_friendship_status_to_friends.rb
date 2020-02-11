class AddFriendshipStatusToFriends < ActiveRecord::Migration[6.0]
  def change
    add_column :friends, :friendship_status, :boolean, default: false
  end
end
