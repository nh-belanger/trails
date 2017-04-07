class AddPictureToTrails < ActiveRecord::Migration[5.0]
  def change

        add_column :trails, :picture, :string
  end
end
