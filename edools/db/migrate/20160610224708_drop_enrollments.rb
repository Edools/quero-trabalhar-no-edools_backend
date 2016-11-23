class DropEnrollments < ActiveRecord::Migration
  def change
    drop_table :enrollments
  end
end
