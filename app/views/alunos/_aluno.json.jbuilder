json.extract! aluno, :id, :nome, :matricula, :status, :curso_id, :escola_id, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)