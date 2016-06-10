class RemoveActiveStudentsColumn < ActiveRecord::Migration
  def change
    remove_column :courses, :active_students
  end
end
