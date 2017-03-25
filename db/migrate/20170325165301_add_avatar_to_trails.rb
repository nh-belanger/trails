class AddAvatarToTrails < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :trails, :avatar
  end

  def self.down
    remove_attachment :trails, :avatar
  end
end
