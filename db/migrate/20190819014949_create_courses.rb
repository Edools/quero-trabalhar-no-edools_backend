class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :tittle
      t.string :description
      t.string :content
      t.integer :duration
      t.integer :price
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
