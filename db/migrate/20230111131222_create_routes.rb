class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.integer :user_id, null: false
      t.integer :drive_route_id
      t.string :destination, null: false
      t.text :destination_memo
      t.integer :drive_report_id
      t.timestamps
    end
  end
end
