class RemoveColumn < ActiveRecord::Migration
  def change
    change_table(:cursos) do |t|
      t.remove :escolas_id
    end
  end
end
