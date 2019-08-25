class CriaTabelaCursos < ActiveRecord::Migration[5.2]
  def change
    create_table 'edools.tb_cursos' do |t|
      t.integer :tb_escolas_id
      t.string :titulo
      t.text :descricao
      t.text :conteudo
      t.integer :duracao
      t.integer :qtd_alunos_ativos
      t.decimal :preco

      t.timestamps
    end
    add_foreign_key 'edools.tb_cursos', 'edools.tb_escolas',
                    column: :tb_escolas_id
  end
end
