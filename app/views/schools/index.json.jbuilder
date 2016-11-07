json.array!(@schools) do |school|
  json.extract! school, :id, :name, :contact_email, :subdomain, :foundation, :pitch, :user_id
  json.url school_url(school, format: :json)
end
