class AddTrails < ActiveRecord::Migration[5.0]
  def change
    create_table :trails do |t|
      t.string :name, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.float :length
      t.string :address, null: false
      t.string :description
      t.integer :creator_id
    end
  end
end
