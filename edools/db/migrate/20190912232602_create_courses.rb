# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.references :school, index: true, null: false
      t.string :description, null: false
      t.text :content, null: false
      t.integer :duration, null: false
      t.decimal :price, precision: 8, scale: 2, null: false
      t.timestamps
    end
  end
end
