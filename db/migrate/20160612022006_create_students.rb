class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.belongs_to :course, index: true, foreign_key: true
      t.string :matricula

      t.timestamps null: false
    end
  end
end
