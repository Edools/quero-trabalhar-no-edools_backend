class CreateSchoolReports < ActiveRecord::Migration[5.1]
  def change
    create_table :school_reports do |t|
      t.belongs_to :school
      t.integer :month_active_students
      t.integer :accumulated_active_students

      t.timestamps
    end
  end
end
