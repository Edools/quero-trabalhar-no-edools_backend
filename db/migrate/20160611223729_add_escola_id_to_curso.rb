class AddEscolaIdToCurso < ActiveRecord::Migration
  def change
    add_column :cursos, :escola_id, :integer
  end
end
