class AddDurationPeriodicityToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :periodicity, :string
	change_column :courses, :duration, 'integer USING 1'
  end
end
