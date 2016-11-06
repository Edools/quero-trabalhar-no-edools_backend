json.extract! curso, :id, :titulo, :descricao, :conteudo, :duracao, :data, :preco, :escola_id, :aluno_id, :created_at, :updated_at
json.url curso_url(curso, format: :json)