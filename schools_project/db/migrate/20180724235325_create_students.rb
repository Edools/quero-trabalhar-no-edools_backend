# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.references :course, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
