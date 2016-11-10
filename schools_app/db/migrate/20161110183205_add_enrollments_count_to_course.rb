class AddEnrollmentsCountToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :enrollments_count, :integer
  end
end
