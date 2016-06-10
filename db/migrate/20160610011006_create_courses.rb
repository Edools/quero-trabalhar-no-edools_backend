class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.text :content
      t.references :school, index: true, foreign_key: true
      t.string :duration
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
