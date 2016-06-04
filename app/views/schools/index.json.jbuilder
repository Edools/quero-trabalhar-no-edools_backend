json.array!(@schools) do |school|
  json.extract! school, :id, :name, :owner_email, :pitch, :subdomain, :date_of_creation
  json.url school_url(school, format: :json)
end