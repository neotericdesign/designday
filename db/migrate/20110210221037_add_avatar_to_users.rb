class AddAvatarToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :avatar_id, :integer
  end

  def self.down
    remove_column :users, :avatar_id
  end
end
