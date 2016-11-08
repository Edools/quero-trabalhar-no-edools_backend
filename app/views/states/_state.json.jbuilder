json.extract! state, :id, :name, :abbr, :country_id, :created_at, :updated_at
json.url state_url(state, format: :json)