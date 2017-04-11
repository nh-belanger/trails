class AddAvatarToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_picture, :string
    add_column :trails, :picture, :string
  end
end
