class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.date :birthday, null: false

      t.timestamps null: false
    end

    add_index :students, :name
    add_index :students, :email, unique:  true
  end
end
