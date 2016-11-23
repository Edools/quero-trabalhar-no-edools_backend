json.array!(@cursos) do |curso|
  json.extract! curso, :id, :titulo, :descricao, :conteudo, :duracao, :alunos_ativos, :preco
  json.url curso_url(curso, format: :json)
end
