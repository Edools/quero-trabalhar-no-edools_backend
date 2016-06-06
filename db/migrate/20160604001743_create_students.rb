class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :register_number
      t.boolean :status

      t.timestamps null: false
    end
  end
end
