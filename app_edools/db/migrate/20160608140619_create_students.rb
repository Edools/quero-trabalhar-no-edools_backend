class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :adress
      t.string :phone
      t.string :document

      t.timestamps null: false
    end
  end
end
