json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :company, :phone, :email, :customer_id
  json.url contact_url(contact, format: :json)
end
