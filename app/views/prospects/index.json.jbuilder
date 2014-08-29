json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :address, :city
  json.url customer_url(customer, format: :json)
end

json.array!(@prospects) do |prospect|
  json.extract! prospect, :id, :name, :address, :city, :due_date
  json.title (prospect.name) +" From " + prospect.city
  json.start prospect.due_date
  json.end prospect.due_date
  json.url edit_prospect_path(prospect)
end
