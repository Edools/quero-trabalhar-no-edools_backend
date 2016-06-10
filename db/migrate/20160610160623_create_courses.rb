class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.references :school, index: true, foreign_key: true, null: false
      t.text :description
      t.text :content
      t.string :duration
      t.decimal :price, precision: 8, scale: 2, null: false
      t.integer :total_active_students, default: 0

      t.timestamps null: false
    end
  end
end
