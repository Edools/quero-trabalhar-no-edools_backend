class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :enrollment
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
