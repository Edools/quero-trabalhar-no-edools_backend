class AddSchoolIdToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :school, index: true, foreign_key: true
  end
end
