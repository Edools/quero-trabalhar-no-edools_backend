json.array!(@schools) do |school|
  json.extract! school, :id, :name, :email, :pitch, :subdomain, :creation_date
  json.url school_url(school, format: :json)
end
