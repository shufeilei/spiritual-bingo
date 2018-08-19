class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title, limit: 512
      t.string :description, limit: 1024
      t.string :location, limit: 1024
      t.datetime :start_at
      t.datetime :end_at
      t.string :backgroundImagePath, limit: 1024
    end
  end
end
