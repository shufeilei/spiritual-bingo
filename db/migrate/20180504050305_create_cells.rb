class CreateCells < ActiveRecord::Migration[5.2]
  def change
    create_table :cells do |t|
      t.integer :row
      t.integer :col
      t.string :response
      t.datetime :finished_at
      t.references :board, index: true
    end
  end
end
