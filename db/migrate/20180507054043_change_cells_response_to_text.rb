class ChangeCellsResponseToText < ActiveRecord::Migration[5.2]
  def change
    change_column :cells, :response, :text
  end
end
