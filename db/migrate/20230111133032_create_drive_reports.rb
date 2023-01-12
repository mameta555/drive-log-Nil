class CreateDriveReports < ActiveRecord::Migration[6.1]
  def change
    create_table :drive_reports do |t|
      t.integer :route_id, null: false
      t.integer :user_id, null: false
      t.text :assessment, null: false
      t.timestamps
    end
  end
end
