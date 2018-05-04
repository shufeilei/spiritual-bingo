class CreateCells < ActiveRecord::Migration[5.2]
  def change
    create_table :cells do |t|
      t.integer :cell_num
      t.string :response
      t.datetime :finished_at
      t.references :board, index: true
      t.timestamps
    end
  end
end
