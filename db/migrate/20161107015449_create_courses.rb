class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title, :null => false
      t.references :school, foreign_key: true, :null => false
      t.string :description, :null => false
      t.text :content, :null => false
      t.string :duration, :null => false
      t.decimal :price, :null => false

      t.timestamps
    end
  end
end
