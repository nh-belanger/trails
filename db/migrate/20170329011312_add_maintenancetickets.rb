class AddMaintenancetickets < ActiveRecord::Migration[5.0]
  def change
    create_table :maintenancetickets do |t|
      t.string :location, null: false
      t.string :body, null: false
      t.integer :trail_id, null: false
    end
  end
end
