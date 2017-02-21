class AddTrails < ActiveRecord::Migration[5.0]
  def change
    create_table :trails do |t|
      t.string :name, null: false
      t.float :trailhead_lat, null: false
      t.float :trailhead_long, null: false
      t.float :length
      t.string :address, null: false
    end
  end
end
