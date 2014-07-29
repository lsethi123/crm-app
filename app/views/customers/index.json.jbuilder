json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :address, :city
  json.url customer_url(customer, format: :json)
end
