json.array!(@emails) do |email|
  json.extract! email, :id, :email, :references, :
  json.url email_url(email, format: :json)
end
