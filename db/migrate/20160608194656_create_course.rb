class CreateCourse < ActiveRecord::Migration
  def change
    create_table :course do |t|
      t.string :title,            null: false
      t.text :description
      t.text :content
      t.integer :duration,        null: false
      t.integer :active_students, null: false
      t.decimal :price,           null: false, precision: 8, scale: 2
      t.references :school, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
