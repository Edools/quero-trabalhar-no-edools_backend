json.array!(@escolas) do |escola|
  json.extract! escola, :id, :nome, :email, :pitch, :subdominio, :data_criacao
  json.url escola_url(escola, format: :json)
end
