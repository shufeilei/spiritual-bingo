class AddPictureColumnToCells < ActiveRecord::Migration[5.2]
  def change
    add_attachment :cells, :picture
  end
end
