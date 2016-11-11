class AddCoursesCountToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :courses_count, :integer
  end
end
