
json.array!(@prospects) do |prospect|
  json.extract! prospect, :id, :name, :address, :city, :due_date
  json.title (prospect.name) +" From " + prospect.city
  json.start prospect.due_date
  json.end prospect.due_date
end