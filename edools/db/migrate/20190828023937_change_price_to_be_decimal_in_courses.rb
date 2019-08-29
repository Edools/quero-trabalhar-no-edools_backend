class ChangePriceToBeDecimalInCourses < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :price, :decimal
  end
end
