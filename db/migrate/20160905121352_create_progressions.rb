class CreateProgressions < ActiveRecord::Migration
  def change
    create_table :progressions do |t|
      t.integer :part_number
      t.integer :lesson_number
      t.references :student

      t.timestamps null: false
    end
  end
end
