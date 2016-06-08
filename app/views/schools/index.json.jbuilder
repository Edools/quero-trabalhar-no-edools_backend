json.array!(@schools) do |school|
  json.extract! school, :id, :name, :owner_email, :pitch, :subdomain
  json.url school_url(school, format: :json)
end
