class CreateDriveComments < ActiveRecord::Migration[6.1]
  def change
    create_table :drive_comments do |t|
      t.integer :user_id, null: false
      t.integer :drive_route_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
