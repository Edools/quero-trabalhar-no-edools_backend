class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|
      t.references :school, foreign_key: true, :null => false
      t.references :student, foreign_key: true, :null => false
      t.integer :status, :null => false, :default => :active

      t.timestamps
    end
  end
end
