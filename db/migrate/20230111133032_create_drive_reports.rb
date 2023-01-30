class CreateDriveReports < ActiveRecord::Migration[6.1]
  def change
    create_table :drive_reports do |t|
      t.integer :user_id, null: false
      t.text :assessment
      t.integer :status, default: 0, null:false
      t.string :title, null: false
      t.timestamps
    end
  end
end
