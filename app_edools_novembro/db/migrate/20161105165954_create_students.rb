class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :address
      t.string :document
      t.string :phone
      t.string :responsible
      t.string :registration

      t.timestamps null: false
    end
  end
end
