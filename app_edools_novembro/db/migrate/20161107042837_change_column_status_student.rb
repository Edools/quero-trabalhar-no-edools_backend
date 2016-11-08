class ChangeColumnStatusStudent < ActiveRecord::Migration
  def change
    change_column_default(:students, :status, nil)
  end
end
