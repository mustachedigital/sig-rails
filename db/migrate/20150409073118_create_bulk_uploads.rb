class CreateBulkUploads < ActiveRecord::Migration
  def change
    create_table :bulk_uploads do |t|
      t.attachment :file
      t.boolean :is_imported
      t.integer :num_failures

      t.timestamps null: false
    end
  end
end
