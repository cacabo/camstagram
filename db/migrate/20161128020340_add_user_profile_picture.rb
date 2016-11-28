class AddUserProfilePicture < ActiveRecord::Migration
  def self.up
    add_attachment :users, :profile_picture
  end

  def self.down
    remove_attachment :users, :profile_picture
  end
end
