class AddUserIdToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :user, index: true, foreign_key: true
  end
end
