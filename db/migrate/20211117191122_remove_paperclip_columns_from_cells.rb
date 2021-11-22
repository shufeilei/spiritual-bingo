class RemovePaperclipColumnsFromCells < ActiveRecord::Migration[6.1]
  def up
    remove_column :cells, :picture_content_type
    remove_column :cells, :picture_file_name
    remove_column :cells, :picture_file_size
    remove_column :cells, :picture_updated_at
  end

  def down
    add_column :cells, :picture_content_type, :string
    add_column :cells, :picture_file_name, :string
    add_column :cells, :picture_file_size, :integer
    add_column :cells, :picture_updated_at, :datetime
  end
end
