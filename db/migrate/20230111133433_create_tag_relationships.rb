class CreateTagRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relationships do |t|
      t.integer :drive_route_id, null: false
      t.integer :tag_name_id
      t.timestamps
    end
  end
end
